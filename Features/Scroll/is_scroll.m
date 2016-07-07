function [ res ] = is_scroll( sc_in, sc_fin )

    res = 0;
    scroll_threshold = 1000;
	max_threshold = 100;
    
    %sc_in = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_init.png');
    sc_in = double(rgb2gray(sc_in));
    [CA_in] = dwt2(sc_in, 'haar');
    [CA_in] = dwt2(CA_in, 'haar');
    [CA_in] = dwt2(CA_in, 'haar');
    [CA_in] = dwt2(CA_in, 'haar');
    %CA_in = sc_in;
    %imshow(CA_in);

    %sc_fin = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_fin.png');
    sc_fin = double(rgb2gray(sc_fin));
    [CA_fin] = dwt2(sc_fin, 'haar');
    [CA_fin] = dwt2(CA_fin, 'haar');
    [CA_fin] = dwt2(CA_fin, 'haar');
    [CA_fin] = dwt2(CA_fin, 'haar');
    %CA_fin = sc_fin;
    %figure, imshow(CA_fin);

    c = normxcorr2(CA_in,CA_fin);
    %figure, surf(c), shading flat;
    [ypeak, xpeak] = find(c==max(c(:)));
    yoffSet = ypeak-size(CA_in,1);
    xoffSet = xpeak-size(CA_in,2);

    corr_offset = [(yoffSet) (xoffSet)];
    disp(corr_offset);

    trans_in = imtranslate(sc_in, corr_offset);
    %figure, imshow(trans_in);

    trans_fin = sc_fin;
    if yoffSet < 0
        trans_fin((size(sc_fin, 1)+yoffSet):size(sc_fin, 1), :) = 0;
    elseif yoffSet == 0
    else
        trans_fin(0:yoffSet, :) = 0;
    end

    if xoffSet < 0
        trans_fin((size(sc_fin, 2)+yoffSet):size(sc_fin, 2), :) = 0;
    elseif xoffSet == 0
    else
        trans_fin(0:xoffSet, :) = 0;
    end
    %figure, imshow(trans_fin);

    trans_diff = imabsdiff(trans_in, trans_fin);

    %disp(sqrt(mean(trans_diff(:).^2)));
    if(sqrt(mean(trans_diff(:).^2)) < scroll_threshold)
            CA_in = sc_in;
            CA_fin = sc_fin;
            
            c = normxcorr2(CA_in,CA_fin);
            %figure, surf(c), shading flat;
            [ypeak, xpeak] = find(c==max(c(:)));
            yoffSet = ypeak-size(CA_in,1);
            xoffSet = xpeak-size(CA_in,2);

            corr_offset = [(yoffSet) (xoffSet)];
            disp(corr_offset);

            trans_in = imtranslate(sc_in, corr_offset);
            %figure, imshow(trans_in);

            trans_fin = sc_fin;
            if yoffSet < 0
                trans_fin((size(sc_fin, 1)+yoffSet):size(sc_fin, 1), :) = 0;
            elseif yoffSet == 0
            else
                trans_fin(0:yoffSet, :) = 0;
            end

            if xoffSet < 0
                trans_fin((size(sc_fin, 2)+yoffSet):size(sc_fin, 2), :) = 0;
            elseif xoffSet == 0
            else
                trans_fin(0:xoffSet, :) = 0;
            end
            trans_diff = imabsdiff(trans_in, trans_fin);
            %disp(sqrt(mean(trans_diff(:).^2)));
            if(sqrt(mean(trans_diff(:).^2)) < scroll_threshold)
				if(yoffSet < max_threshold && xoffSet < max_threshold)
					res = 1;
				end
            end
    end

end
