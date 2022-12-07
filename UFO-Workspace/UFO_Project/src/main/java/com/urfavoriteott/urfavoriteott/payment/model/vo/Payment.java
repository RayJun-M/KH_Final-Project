package com.urfavoriteott.urfavoriteott.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Payment {
	private int payNo; // PAY_NO
	private int payOrderNo; // PAY_ORDER_NO
	private int userNo; // USER_NO
	private int payment; // PAYMENT
	private String payDate; // PAY_DATE
	private String endDate; // PAY_END_DATE
	private String status; // PAY_STATUS
	private String payURL; // PAY_URL
}
