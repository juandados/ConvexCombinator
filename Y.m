function y=Y(varargin)
y=1;
for i=1:nargin
y=min(y,varargin{i});
end
end