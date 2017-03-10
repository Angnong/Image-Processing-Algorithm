function S = region_growing(I, x_start, y_start, threshold)
% input: Image I, position(x_start,ystart), threshold
% output: segmented region
[m,n] = size(I);
S = zeros(m,n);
p_start = sub2ind(size(I),x_start,y_start);
S(p_start) = 1;
ap_list = [p_start-m;p_start-1;p_start+1;p_start+m]; % 四邻域拓展
region_mean = I(x_start,y_start);
count = 1;
    while ~isempty(ap_list)
      x = find(abs(I(ap_list)-region_mean)==min(abs(I(ap_list)-region_mean)));
      p = x;
      if abs(I(ap_list(p(1)))-region_mean) > threshold
        return
      end

      S(ap_list(p)) = 1; % treate it as region element
      pixel = I(ap_list(p(1)));
      % 弹出元素并且压入当前区域的边界位置元素
      ap_list(p) = [];
      N = conv2(double(S),[0,1,0;1,0,1;0,1,0],'same'); 
      ap_list = find(N > 0 & S < 1); % find the current region borders
      
      count = count+length(p);
      % update region mean
      region_mean = (region_mean*(count-length(p))+pixel*length(p))/count;
      
    end

end