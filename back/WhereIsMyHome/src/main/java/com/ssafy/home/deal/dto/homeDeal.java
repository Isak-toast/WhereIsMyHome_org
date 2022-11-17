package com.ssafy.home.deal.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class homeDeal {
	private int no;
	private String dealAmount;
	private int dealYear;
	private int dealMonth;
	private int dealDay;
	private String area;
	private String floor;
	private String cancelDealType;
	private int aptCode;
}
