package com.ssafy.happyhouse.util;

import java.util.List;

import com.ssafy.happyhouse.domain.NoticeDto;

public class MergeSort 
{
	
	public void mergeSort(List<NoticeDto> arr) {
        sort(arr, 0, arr.size());
    }

    private void sort(List<NoticeDto> arr, int low, int high) {
        if (high - low < 2) {
            return;
        }

        int mid = (low + high) / 2;
        sort(arr, 0, mid);
        sort(arr, mid, high);
        merge(arr, low, mid, high);
    }

    private void merge(List<NoticeDto> arr, int low, int mid, int high) {
    	NoticeDto[] temp = new NoticeDto[high - low];
        int t = 0, l = low, h = mid;

        while (l < mid && h < high) {
            if (arr.get(l).getNoticeno() > arr.get(h).getNoticeno()) {
                temp[t++] = arr.get(l++);
            } else {
                temp[t++] = arr.get(h++);
            }
        }

        while (l < mid) {
            temp[t++] = arr.get(l++);
        }

        while (h < high) {
            temp[t++] = arr.get(h++);
        }

        for (int i = low; i < high; i++) {
            arr.set(i, temp[i - low]);
        }
    }

}