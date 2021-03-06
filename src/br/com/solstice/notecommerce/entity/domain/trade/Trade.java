package br.com.solstice.notecommerce.entity.domain.trade;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Trade extends DomainEntity {
	
	private TradeType type;
	private String trackingNumber;
	private LocalDateTime requestDate;
	private TradeStatus status;
	private Integer productQuantity;
	private SaleItem saleItem;
	private Sale sale;
	
	public static String generateTrackingNumber(Long userId) {
		String millisString = String.valueOf(System.currentTimeMillis());
		return userId + "" + new StringBuilder(millisString).reverse();
	}
	
	public Double getBalanceReturn() {
		// TODO: fix not returning decimals
		return saleItem.getPricePerProduct() * (double) productQuantity;
	}
	
	public String getFormattedRequestDate() {
		return requestDate != null ? requestDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) : null;
	}
	
	public String getFormattedISORequestDate() {
		return requestDate != null ? requestDate.format(DateTimeFormatter.ISO_DATE_TIME) : null;
	}

}
