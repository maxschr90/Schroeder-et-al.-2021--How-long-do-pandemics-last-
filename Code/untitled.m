XX= [years',Influenza_UK(:,2:end)];
temp = [mean(XX(4:13,2:end),'omitnan')'];
temp = [temp,mean(XX(14:23,2:end),'omitnan')'];
temp = [temp,mean(XX(24:25,2:end),'omitnan')'];
temp = [temp,mean(XX(26:35,2:end),'omitnan')'];
temp = [temp,mean(XX(36:45,2:end),'omitnan')'];
temp = [temp,mean(XX(46:55,2:end),'omitnan')'];
temp = round(temp)