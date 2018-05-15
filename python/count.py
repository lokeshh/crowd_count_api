#Detect face using viola-jones

import numpy as np
import cv2
import argparse
from imutils import paths

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--images", required=True, help="path to images directory")
args = vars(ap.parse_args())

# loop over the image paths
imagePath = args["images"]

face_cascade = cv2.CascadeClassifier('/usr/share/opencv/haarcascades/haarcascade_frontalface_default.xml')
upperbody_cascade = cv2.CascadeClassifier('/usr/share/opencv/haarcascades/haarcascade_mcs_upperbody.xml')
fullbody_cascade = cv2.CascadeClassifier('python/custom.xml')
people_cascade = cv2.CascadeClassifier('python/people.xml')
another_cascade = cv2.CascadeClassifier('python/haarcascade_frontalface_alt.xml')

img = cv2.imread(imagePath)
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

faces1 = face_cascade.detectMultiScale(gray)
faces2 = upperbody_cascade.detectMultiScale(gray)
faces3 = fullbody_cascade.detectMultiScale(gray)
faces4 = people_cascade.detectMultiScale(gray)
faces5 = people_cascade.detectMultiScale(gray)

print len(faces4) + len(faces3) / 2
# print faces2
