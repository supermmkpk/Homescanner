package com.myhome.homeinfo.model.service;

import java.util.ArrayList;
import java.util.List;

import com.myhome.homeinfo.model.HomeInfoDto;

public class HomeInfoSortAsc {

	public static List<HomeInfoDto> Sort(List<HomeInfoDto> list, String type) {
		if (list.size() <= 1) {
			return list;
		}
		List<HomeInfoDto> aList = new ArrayList<HomeInfoDto>();
		aList = list.subList(0, list.size() / 2);

		List<HomeInfoDto> bList = new ArrayList<HomeInfoDto>();
		bList = list.subList(list.size() / 2, list.size());

		Sort(aList, type);
		Sort(bList, type);
		if ("apartmentName".equals(type)) {
			mergeApartmentName(aList, bList, list);
		} else if ("floor".equals(type)) {
			mergeFloor(aList, bList, list);
		} else if ("exclusiveArea".equals(type)) {
			mergeExclusiveArea(aList, bList, list);
		} else if ("dong".equals(type)) {
			mergeDong(aList, bList, list);
		} else if ("dealAmount".equals(type)) {
			mergeDealAmount(aList, bList, list);
		}
		return list;
	}

	private static List<HomeInfoDto> mergeApartmentName(List<HomeInfoDto> alist, List<HomeInfoDto> blist,
			List<HomeInfoDto> list) {
		int alistIndex = 0, blistIndex = 0, listIndex = 0;
		while (alistIndex < alist.size() && blistIndex < blist.size()) {
			if (alist.get(alistIndex).getApartmentName().compareTo(blist.get(blistIndex).getApartmentName()) <= 0) {
				list.set(listIndex, alist.get(alistIndex));
				alistIndex++;
			} else {
				list.set(listIndex, blist.get(blistIndex));
				blistIndex++;
			}
			listIndex++;
		}
		List<HomeInfoDto> rest;
		if (alistIndex == alist.size()) {
			rest = blist.subList(blistIndex, blist.size());
			for (int c = blistIndex; c < rest.size(); c++) {
				list.set(listIndex, blist.get(c));
				listIndex++;
			}
		} else {
			rest = alist.subList(alistIndex, alist.size());
			for (int c = alistIndex; c < rest.size(); c++) {
				list.set(listIndex, alist.get(c));
				listIndex++;
			}
		}
		return list;
	}

	private static List<HomeInfoDto> mergeFloor(List<HomeInfoDto> alist, List<HomeInfoDto> blist,
			List<HomeInfoDto> list) {
		int alistIndex = 0, blistIndex = 0, listIndex = 0;
		while (alistIndex < alist.size() && blistIndex < blist.size()) {
			if (Double.parseDouble(alist.get(alistIndex).getFloor()) < Double
					.parseDouble(blist.get(blistIndex).getFloor())) {
				list.set(listIndex, alist.get(alistIndex));
				alistIndex++;
			} else {
				list.set(listIndex, blist.get(blistIndex));
				blistIndex++;
			}
			listIndex++;
		}
		List<HomeInfoDto> rest;
		if (alistIndex == alist.size()) {
			rest = blist.subList(blistIndex, blist.size());
			for (int c = blistIndex; c < rest.size(); c++) {
				list.set(listIndex, blist.get(c));
				listIndex++;
			}
		} else {
			rest = alist.subList(alistIndex, alist.size());
			for (int c = alistIndex; c < rest.size(); c++) {
				list.set(listIndex, alist.get(c));
				listIndex++;
			}
		}
		return list;
	}

	private static List<HomeInfoDto> mergeExclusiveArea(List<HomeInfoDto> alist, List<HomeInfoDto> blist,
			List<HomeInfoDto> list) {
		int alistIndex = 0, blistIndex = 0, listIndex = 0;
		while (alistIndex < alist.size() && blistIndex < blist.size()) {
			if (Double.parseDouble(alist.get(alistIndex).getExclusiveArea()) < Double
					.parseDouble(blist.get(blistIndex).getExclusiveArea())) {
				list.set(listIndex, alist.get(alistIndex));
				alistIndex++;
			} else {
				list.set(listIndex, blist.get(blistIndex));
				blistIndex++;
			}
			listIndex++;
		}
		List<HomeInfoDto> rest;
		if (alistIndex == alist.size()) {
			rest = blist.subList(blistIndex, blist.size());
			for (int c = blistIndex; c < rest.size(); c++) {
				list.set(listIndex, blist.get(c));
				listIndex++;
			}
		} else {
			rest = alist.subList(alistIndex, alist.size());
			for (int c = alistIndex; c < rest.size(); c++) {
				list.set(listIndex, alist.get(c));
				listIndex++;
			}
		}
		return list;
	}

	private static List<HomeInfoDto> mergeDong(List<HomeInfoDto> alist, List<HomeInfoDto> blist,
			List<HomeInfoDto> list) {
		int alistIndex = 0, blistIndex = 0, listIndex = 0;
		while (alistIndex < alist.size() && blistIndex < blist.size()) {
			if (alist.get(alistIndex).getDong().compareTo(blist.get(blistIndex).getDong()) <= 0) {
				list.set(listIndex, alist.get(alistIndex));
				alistIndex++;
			} else {
				list.set(listIndex, blist.get(blistIndex));
				blistIndex++;
			}
			listIndex++;
		}
		List<HomeInfoDto> rest;
		if (alistIndex == alist.size()) {
			rest = blist.subList(blistIndex, blist.size());
			for (int c = blistIndex; c < rest.size(); c++) {
				list.set(listIndex, blist.get(c));
				listIndex++;
			}
		} else {
			rest = alist.subList(alistIndex, alist.size());
			for (int c = alistIndex; c < rest.size(); c++) {
				list.set(listIndex, alist.get(c));
				listIndex++;
			}
		}
		return list;
	}

	private static List<HomeInfoDto> mergeDealAmount(List<HomeInfoDto> alist, List<HomeInfoDto> blist,
			List<HomeInfoDto> list) {
		int alistIndex = 0, blistIndex = 0, listIndex = 0;
		while (alistIndex < alist.size() && blistIndex < blist.size()) {
			if (Integer.parseInt(alist.get(alistIndex).getDealAmount().replace(",","").replace(" ", "")) < Integer
					.parseInt(blist.get(blistIndex).getDealAmount().replace(",","").replace(" ", ""))) {
				list.set(listIndex, alist.get(alistIndex));
				alistIndex++;
			} else {
				list.set(listIndex, blist.get(blistIndex));
				blistIndex++;
			}
			listIndex++;
		}
		List<HomeInfoDto> rest;
		if (alistIndex == alist.size()) {
			rest = blist.subList(blistIndex, blist.size());
			for (int c = blistIndex; c < rest.size(); c++) {
				list.set(listIndex, blist.get(c));
				listIndex++;
			}
		} else {
			rest = alist.subList(alistIndex, alist.size());
			for (int c = alistIndex; c < rest.size(); c++) {
				list.set(listIndex, alist.get(c));
				listIndex++;
			}
		}
		return list;
	}
}