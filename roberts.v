module robert( 
	clk,
	p0, 
	p1, 
	p2, 
	p3, 
	p4,
	p5, 
	p6, 
	p7, 
	p8, 
	out);

input clk;
input  [7:0] p0,p1,p2,p3,p4,p5,p6,p7,p8;	// 8 бит входные пиксели
output [7:0] out;					// 8 бит выходной пиксели

reg [10:0] gx,gy;    //11 бит потому что максимальное значение gx и gy 255*4. 
//Последний бит под знак				 
reg [10:0] abs_gx,abs_gy;	//Абсолютное значение gx и gy
reg [10:0] sum;			//Маскимальное значение 255*8. Здесь знак не нужен
always @(posedge clk) 
begin
	 gx <=(p4-p3);//Градиент по горизонтали
	 gy <=(p4-p3);//Градиент по вертикали
	 abs_gx <= (gx[10]? ~gx+1 : gx);	// абсолютное значение gx
	 abs_gy <= (gy[10]? ~gy+1 : gy);	// абсолютное значение gy
	 sum <= (abs_gx+abs_gy);				// нахождение суммы
end
	assign out = (|sum[10:8])?8'hff : sum[7:0];	// чтоб не вылезло за 0-255.
endmodule