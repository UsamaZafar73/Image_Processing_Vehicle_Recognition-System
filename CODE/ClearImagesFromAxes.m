function ClearImagesFromAxes(h)
	axesHandlesToChildObjects = findobj(h, 'Type', 'image');
	if ~isempty(axesHandlesToChildObjects)
		delete(axesHandlesToChildObjects);
	end
	return; % from ClearImagesFromAxes