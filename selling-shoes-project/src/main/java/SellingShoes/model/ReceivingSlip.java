package SellingShoes.model;

import java.sql.Date;
import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="receiving_slip")
public class ReceivingSlip {
	@Id
	private int receivingId;
	private int purchaseOrderId;
	private String description;
	private Date createDate;
	private Date dateReceived;
	private String provider;
	private String telephone;
	private String address;
	private String status;
	@OneToMany(mappedBy = "receiving_details", cascade = CascadeType.ALL)
	private ArrayList<ReceivingDetail> receivingDetail = new ArrayList<ReceivingDetail>();
}
