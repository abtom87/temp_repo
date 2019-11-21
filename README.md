# temp_repo
On master Branch
ok!
xfdsf
new change in readme
Changed READMe on Jan1,2019


asdasdasd

#define u8 unsigned char
#define u32 unsigned long
#define MAC_OCTETS_COUNT 6

typedef struct {
        u8  octet_value;
        u8  fuse_offset;
} mac_octet;

typedef struct {
        mac_octet octets[MAC_OCTETS_COUNT];
} mac_address;
#define TRACE_DEBUG_ERROR(str) printf("\nERROR: %s",str);
#define DEBUG_VAL(str, val) printf("\n%s, : %d\n", str,val)


u8 MAC_address[MAC_OCTETS_COUNT]={0};

u8 calc_str_len(char* a_string);
u8 calc_str_len(char* a_string){

	int i=0 ;
	while(*(a_string+i) != '\0')
	{
		printf("%c",*(a_string+i));
		i++;
	}

	return i; //strlen(a_string);
}

static int hex2num(u8 c)
{
	if (c >= '0' && c <= '9')
	{
		DEBUG_VAL("InHex2num", (c-'0'));
		return c - '0';

	}

	if (c >= 'a' && c <= 'f')
	{
		DEBUG_VAL("InHex2num", c - 'a' + 10 );
		return c - 'a' + 10;
	}

	if (c >= 'A' && c <= 'F')
	{
		DEBUG_VAL("InHex2num", c - 'A' + 10 );
		return c - 'A' + 10;
	}
		//return c - 'A' + 10;
	TRACE_DEBUG_ERROR("HEX2NUM returns garbage");
	return -1;
}



int hwaddr_aton(char *txt, u8 * addr)
{
	int i;

	for (i = 0; i < MAC_OCTETS_COUNT; i++) {
		int a, b;

		a = hex2num(*txt++);
		if (a < 0)
			return -1;
		b = hex2num(*txt++);
		if (b < 0)
			return -1;
		*addr++ = (a << 4) | b;
		if (i < (MAC_OCTETS_COUNT - 1) && *txt++ != ':')
			return -1;
	}

	return 0;
}



typedef struct MAC_Addr_Struct_t{

	u32 MAC_upperbits;
	u32 MAC_lowerbits;
}MAC_Addr_Struct;

int string_to_MAC(char* , u8*, MAC_Addr_Struct* );
#define MAX_ALLOWED_STR_LEN 17

int string_to_MAC(char* MAC_String , u8* MAC_Addr, MAC_Addr_Struct* a_MAC_Addr )
{
	     //   hwaddr_aton(MAC_String, MAC_Addr) ;

			u32 lsb_mac=0;
			u32 usb_mac=0;
			int i=0;
			int ret_status      =  0;
			char tmp_mac[17]    = {0};
			char u8_MAC_Addr[6] = {0};
			printf("MACSTRING Len: %d \n", strlen(MAC_String));

		    // Exit if the String length is incorrect OR if char pointer is NULL
		    if( ( MAX_ALLOWED_STR_LEN != calc_str_len(MAC_String) )  || ( NULL == MAC_String ) )
		    {
		    	TRACE_DEBUG_ERROR("Exit if the String length is incorrect OR if char pointer is NULL");
		    	return -1 ;
		    }
//		    5 5-5
//			4 5-4
//			3 5-3
//			2 5-2
//			1 5-1
//			0 5-0

//		    for(int j = strlen(MAC_String) - 1 ; j >= 0; j--)
//		    {
//		    	tmp_mac[j] = MAC_String[strlen(MAC_String)-j-1];
//		    	printf("tmp_mac[%d]: %c\n",j,tmp_mac[j]);
//		    }

			ret_status = hwaddr_aton(MAC_String, MAC_Addr);

//			for(int j = MAC_OCTETS_COUNT - 1 ; j >= 0; j--)
//			{
//				u8_MAC_Addr[j] = MAC_Addr[MAC_OCTETS_COUNT-j-1];
//				printf("u8_MAC_Addr[%d]: 0x%02x\n",j,u8_MAC_Addr[j]);
//
//			}
			u8_MAC_Addr[5] = MAC_Addr[4];
			u8_MAC_Addr[4] = MAC_Addr[5];

			for(i=0 ;i<=3;i++)
			{
				u8_MAC_Addr[3-i] = MAC_Addr[i];


			}
			printf("hwaddr_aton ret: %d\n", ret_status);
			if( ret_status==0 ){
			for (i = 4; i < 6; i++) {
				usb_mac = (usb_mac << 8) | ((unsigned char) u8_MAC_Addr[i]);
				a_MAC_Addr->MAC_upperbits = usb_mac;
			}
			printf("macStruct UB: 0x%08lx \n", a_MAC_Addr->MAC_upperbits);


			for (i = 0; i < 4; i++) {
			   	lsb_mac = (lsb_mac << 8) | ((unsigned char) u8_MAC_Addr[i]);
			   	a_MAC_Addr->MAC_lowerbits = lsb_mac;
			}
			printf("macStruct LB: 0x%lx \n", a_MAC_Addr->MAC_lowerbits);
			for (i=0;i<6;i++)
			{
				printf("\nMACADDR %d: 0x%x \n",i, MAC_Addr[i]);
			}
			return 0;
			}
			else
				return -1;
}
int main(int argc, char *argv[])
{

	u8 MAC_Addr[MAC_OCTETS_COUNT];
	//mac_address mac_add;
	//mac_add = (mac_address *)MAC_Addr;
	MAC_Addr_Struct macStruct;


	printf("Hello World\n");
	printf("ARGV1 %s\n",argv[1]);
	//char mac_string[] = "12:13:72:73:74:75";
	//hwaddr_aton(mac_string, MAC_Addr );
     printf("\nMAIN Calling Strlen argv[1]: %d\n", calc_str_len(argv[1]));
	//string_to_MAC(mac_string, MAC_Addr, &macStruct);
	printf("Retval string to mac: %d \n", string_to_MAC(argv[1], MAC_Addr, &macStruct));
	//printf("macStruct: 0x%d \n", macStruct.MAC_upperbits);
	printf("macStruct UB: 0x%08lx \n", macStruct.MAC_upperbits);
	printf("macStruct LB: 0x%08lx \n", macStruct.MAC_lowerbits);
}









volatile uint32_t *ICSR_Stat= (volatile uint32_t *)&(SCB->ICSR) ;
//__attribute__( ( always_inline ) )

 static inline uint8_t is_ISR_Pending(void){

	if( (*ICSR_Stat >> SCB_ICSR_ISRPENDING_Pos) & 1UL )
	{
		return 1;
	}

	else {
		return 0;
	}

}



