figure(3)
subplot(2,2,1)
            InvCdf = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(7).alpha',Base_Model(7).dmax,Base_Model(7).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:), InvCdf(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:), InvCdf(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf(3,:),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_UK(26:end,7)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks((round(max(Influenza_UK(26:end,7)),0)))
            title('London')
subplot(2,2,2)
            InvCdf = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(5).alpha',Base_Model(5).dmax,Base_Model(5).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:), InvCdf(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:), InvCdf(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf(3,:),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_UK(26:end,5)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks((round(max(Influenza_UK(26:end,5)),0)))
            title('Glasgow')
subplot(2,2,3)

            InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf_US(3,:),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_US(1,21:end)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,37])
            ylim([0,max(InvCdf_US(5,:)*1.05)])

            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks(round(max(Influenza_US(1,21:end)),0))
            title('US')
subplot(2,2,4)
            InvCdf_RUS_1890(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1890,2), InvCdf_RUS_1890(1,:), InvCdf_RUS_1890(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1890,2), InvCdf_RUS_1890(2,:), InvCdf_RUS_1890(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf_RUS_1890(3,:),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_RUS(1,55:80)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,26])
            ylim([0,max(max(InvCdf_RUS_1890(5,:),Influenza_RUS(1,55:80)))*1.05])

            xticks([1 6 11 16 21 26])
            xticklabels({'1892','1897', '1902','1907','1912','1917'}) 
            yticks(round(max(Influenza_RUS(1,55:80)),0))
            title('England & Wales 1890')   

            set (figure(3), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(3);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Figure_3.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Figure_3.emf','BackgroundColor','none')