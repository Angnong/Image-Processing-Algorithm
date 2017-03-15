function S = region_growing(I, x_start, y_start, threshold)
%% 算法描述
%{
  输入图像，所分割区域初始点及阀值
  1. 将初始点的四邻域放到搜索列表，设初始点的值为区域均值
  2. 找到搜索列表中与均值差值最小的点
  3. 判断最小差值是否已超过阀值，若是，则结束，若不是，则将此点加入区域集并从搜索列表剔除
  4，寻找当前区域集的边界，并将其加入搜索列表，并更新区域均值
  5. 重复2-4直到搜索列表为空，返回分割后的区域
}%

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