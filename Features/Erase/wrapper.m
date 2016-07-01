% res must be common - overlapping stroke and erase counted as one
stroke_list = one_per_frame(res_stroke);
erase_list = one_per_frame(res_erase);
stroke_set = stroke_diff(stroke_list);
erase_set = stroke_diff(erase_list);
final_set = [stroke_set, erase_set];
disp(size(final_set));
out_set = frame_split(final_set);
disp(out_set);
stroke_set = out_set;