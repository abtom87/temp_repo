

 date_var = "date | cut -d ' ' -f2-5"
 output = `#{date_var}`
 puts output
class Customer

   def initialize(id, name, addr)
      @cust_id = id
      @cust_name = name
      @cust_addr = addr
      @cust_addr = %x(date | cut -d ' ' -f2-5)
      
      @cust_id = 551
  end
  
$VAR=%x(git branch -a)

   def display_details()
      puts "Customer id #@cust_id"
      puts "Customer name #@cust_name"
      puts "Customer address #@cust_addr"
     
      @var = $VAR
      puts "VAR : #@var "
   end
end



cust1 = Customer.new("1","John","Wisdom Aptmts,CaMbar")
cust1.display_details()
