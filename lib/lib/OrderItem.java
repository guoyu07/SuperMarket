package lib;

public class OrderItem {
     private String orderID;
     private String itemID;
     private String price;
     private String Qty;
     
     public OrderItem(String orderID, String itemID, String price, String Qty){
    	 super();
    	 this.orderID=orderID;
    	 this.itemID=itemID;
    	 this.price=price;
    	 this.Qty=Qty;
     }
     
     public String getOrder(){
    	 return this.orderID;
     }
     
     public String getItem(){
    	 return this.itemID;
     }
     
     public String getPrice(){
    	 return this.price;
     }
     
     public String getQty(){
    	 return this.Qty;
     }
}
