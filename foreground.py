import numpy as np
import cv2

i = 100
fgbg = cv2.BackgroundSubtractorMOG()
while(i < 180):
  print 'img' + `i` + '.jpg'
  frame = cv2.imread(`i` + '.bmp')

  fgmask = fgbg.apply(frame)

  cv2.imshow('frame', fgmask)
  i += 1

  k = cv2.waitKey(30) & 0xff
  if k == 27:
      break

cv2.destroyAllWindows()
