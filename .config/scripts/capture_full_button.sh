#!/bin/zsh

filename="capture_$(date "+D%m_%d_%y_H%H_%M_%S").jpg"

import -window root ~/Images/Screenshots/$filename

