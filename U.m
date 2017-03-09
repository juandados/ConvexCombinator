function y=U(varargin)
y=0;
for i=1:nargin
y=max(y,varargin{i});
end
end