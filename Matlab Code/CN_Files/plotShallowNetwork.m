function out1 = plotShallowNetwork(varargin)
%PLOTSHALLOWNETWORK Plot bias/weight-colored diagram of network
%   Created by Cameron J. Calv
%Collect the arguments passed to the function
if nargin > 0
      [varargin{:}] = convertStringsToChars(varargin{:});
end
%No arguments, find the network and create figure
if nargin == 0
    fig = nnplots.find_training_plot(mfilename);
    if nargout > 0
      out1 = fig;
    elseif ~isempty(fig)
      figure(fig);
    end
    return;
end
%Integrate with Deep Learning Toolboxes network training GUI
in1 = varargin{1};
if ischar(in1)
    switch in1
        case 'parameters'
            out1 = [];
            return
        case 'parameterDefaults'
            out1 = struct;
            return
        case 'data_suitable'
            out1 = true;
            return
        case 'name'
            out1 = 'Network Diagram';
            return
        case 'training'   
            [trainedNetwork,trainingRecord,signals,param] = deal(varargin{2:end});
            fig = nnplots.find_training_plot(mfilename);
            if isempty(fig)
                fig = figure('Visible','on','Tag',['TRAINING_' upper(mfilename)]);
                %screencapture()
            end
            out1 = true;
        otherwise,
        try
          out1 = nnetParam;
          return
        catch me, nnerr.throw(['Unrecognized first argument: ''' in1 ''''])
        end
    end
%Function used normally on a trained network
elseif class(in1) == 'network'
    trainedNetwork = in1;
end
    
fig = nnplots.find_training_plot(mfilename);
if isempty(fig)
    fig = figure;
end
%Collect information about the network
layerNum = numel(trainedNetwork.layers)+2;
nodesPerLayer = [];
for layer=1:(layerNum-2)
    nodesPerLayer = [nodesPerLayer numel(trainedNetwork.b{layer, 1})];
end
nodesPerLayer = [1 nodesPerLayer 1];
nodeBiases = trainedNetwork.b';
inputWeights = trainedNetwork.IW{1, 1};
inputWeightsAverage = mean(inputWeights')';
interWeights = trainedNetwork.LW{2, 1}';
%Configure plot colormap
global numberOfColors; %Default 256
numberOfColors = 128;
cmap = jet(numberOfColors);
%Configure plot nuances
layerSeparation = 2;
nodeSeparation = 0.4;
maxStackedNodeNumber = 5;
xOffsetScale = 0.2;
yOffsetScale = 1.4;
global nodeRadius
nodeRadius = 0.35;
%Plot our network layer by layer, node by node
nodesInLayer = [];
clf(fig);
for layer=1:layerNum
    if layer == 1 %Input Layer
        plotFirstLastNode(0, 0);
        nodeXs = [0];
        nodeYs = [0];
        hold on;
        text(-1, 0, {'Input','Layer'});
        continue;
    else
        previousLayerNodeXs = nodeXs;
        previousLayerNodeYs = nodeYs;
    end
    layerX = max(previousLayerNodeXs) + layerSeparation;
    if layer == layerNum %Output Layer
        for prevNode=1:numel(previousLayerNodeYs)
            plotConnection(layerX-layerSeparation,...
                    previousLayerNodeYs(prevNode),...
                    layerX, 0, 'Black', cmap);
        end
        plotFirstLastNode(layerX, 0);
        text(layerX+0.3, 0, {'Output','Layer'});
    else
        numberOfNodesInThisLayer = numel(nodeBiases{1, layer-1});
        if numberOfNodesInThisLayer == 1
            nodeXs = layerX;
            nodeYs = 0;
        else
              nodeXs = [];
              for i = 1:numberOfNodesInThisLayer
                  xOffset = floor((i-1)/maxStackedNodeNumber)*...
                      xOffsetScale*(nodeRadius+nodeSeparation);
                  nodeXs(i) = layerX + xOffset;
              end
              layerTotalY = maxStackedNodeNumber*(nodeRadius + nodeSeparation);
              nodeYs = linspace(-layerTotalY/2, layerTotalY/2, maxStackedNodeNumber);
              yOffset = 0;
              nodeYsTemp = [];
              for i=1:numberOfNodesInThisLayer
                  yOffset = mod(floor((i-1)/maxStackedNodeNumber),2)*...
                      yOffsetScale*nodeRadius;
                  nodeYsTemp(i) = nodeYs(mod(i,maxStackedNodeNumber)+1)+yOffset;
              end
              nodeYs = nodeYsTemp;
        end
        if layer == 2 %Input weights
            weights = inputWeightsAverage;
        else
            weights = interWeights(:, layer-2);
        end
        %Plot nodes in layer and connections from the previous layer
        for node=1:numel(nodeYs)
            for prevNode=1:numel(previousLayerNodeYs)
                plotConnection(previousLayerNodeXs(prevNode),...
                    previousLayerNodeYs(prevNode),...
                    nodeXs(node), nodeYs(node), weights(node*prevNode), cmap);
            end
            plotNode(nodeBiases{1, layer-1}(node, :), nodeXs(node),...
                nodeYs(node), cmap);
        end
        clear plotConnection
    end
end
set(fig,'Visible','on');
set(gca,'visible','off');
set(gca,'xtick',[]);
xlim([0-nodeRadius,layerX+nodeRadius]);
if exist('trainingRecord', 'var')
    epochs = num2str(max(trainingRecord.epoch));
else
    epochs = "Max";
end
title(strcat("Shallow Network Diagram as of Epoch ", epochs));
set(findall(gca, 'type', 'text'), 'visible', 'on')
colormap(cmap);
colorbar('Location', 'south',...
    'Position', [0.1 0.1 0.8, 0.055],...
    'AxisLocation', 'out',...
    'TickLabels', {'Low Magnitude', 'High Magnitude'},...
    'Ticks', [0 1]);
drawnow
%Reset persistent variables until next call
clear plotNode
clear plotConnection
end
function [nodeCenterX, nodeCenterY] = plotFirstLastNode(x, y)
    global nodeRadius
    radius = nodeRadius;
    nodeCenterX = x;
    nodeCenterY = y;
    rectangle('Position', [x-radius/2, y-radius/2, radius, radius],...
        'Curvature', [1, 1],...
        'FaceColor', [0, 0, 0])
end
%Helper function to plot a node colored by its bias
function [nodeCenterX, nodeCenterY] = plotNode(bias, x, y, cmap)
    global numberOfColors nodeRadius
    persistent max_bias min_bias
    if isempty(max_bias)
        max_bias = 0;
    end
    if isempty(min_bias)
        min_bias = 0;
    end
    if bias > max_bias
        max_bias = bias;
    elseif bias < min_bias
        min_bias = bias;
    end
    color_idx = mapFlt2Int(bias, min_bias, max_bias, 1, numberOfColors);
    color = cmap(color_idx, :);
    radius = nodeRadius;
    nodeCenterX = x;
    nodeCenterY = y;
    rectangle('Position', [x-radius/2, y-radius/2, radius, radius],...
        'Curvature', [1, 1],...
        'FaceColor', color)
    axis equal
end
%Helper function to plot a connection colored by its weight
function plotConnection(x1, y1, x2, y2, weight, cmap)
    global numberOfColors
    persistent max_weight min_weight
    if ~ischar(weight)
        if isempty(max_weight)
            max_weight = 0;
        end
        if isempty(min_weight)
            min_weight = 0;
        end
        if weight > max_weight
            max_weight = weight;
        elseif weight < min_weight
            min_weight = weight;
        end
        color_idx = mapFlt2Int(weight, min_weight, max_weight, 1, numberOfColors);
        color = cmap(color_idx, :);
    else
        color = [0 0 0];
    end
    line = plot([x1,x2],[y1, y2],'Color', color, 'LineWidth', 2);
    uistack(line,'bottom')
end
%Helper function for determing color of node and line
function out = mapFlt2Int(input, in_min, in_max, out_min, out_max)
    out = ((input - in_min)*(out_max - out_min))/(in_max - in_min) + out_min;
    out = round(out);
    if out < 0
        out = 0;
    elseif out > 256
        out = 256;
    end
end