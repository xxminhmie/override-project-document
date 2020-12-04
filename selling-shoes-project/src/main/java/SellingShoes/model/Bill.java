package SellingShoes.model;

import java.sql.Date;
import java.util.ArrayList;

import javax.persistence.*;

@Table(name="bill")
public class Bill {
	@Id
	String billId;
	@ManyToOne
	@JoinColumn(name="customer_id")
	Customer customer;
	Date createdDate;
	Date updateDate;
	Double discount;
	int total;
	String status;
	@OneToMany(mappedBy = "billItem")
	ArrayList<BillItem> billItems = new ArrayList<>();
}
