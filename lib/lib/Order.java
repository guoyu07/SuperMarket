package lib;

public class Order {
      private String orderID;
      private String storeID;
      private String date;
      private String payID;
      private String amount;
      private String staffID;
      
      public Order(String orderID,String storeID,String date,String payID,String amount,String staffID){
    	  super();
    	  this.orderID=orderID;
    	  this.storeID=storeID;
    	  this.date=date;
    	  this.payID=payID;
    	  this.amount=amount;
    	  this.staffID=staffID;
      }
      
      public String getOrder(){
    	  return this.orderID;
      }
      
      public String getStore(){
    	  return this.storeID;
      }
      
      public String getDate(){
    	  return this.date;
      }
      
      public String getPay(){
    	  return this.payID;
      }
      
      public String getAmount(){
    	  return this.amount;
      }
      
      public String getStaff(){
    	  return this.staffID;
      }
}
