package SellingShoes.model;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="seller_account")
public class SellerAccount {
	@Id
	int id;
	String firstName;
	String lastName;
	String phoneNumber;
	String email;
	String password;
	String lazAppkey;
	String lazAppSecret;
	String lazAccessToken;
	String lazAccessExpires;
	String lazRefeshToken;
	String lazRefreshExpires;
}
