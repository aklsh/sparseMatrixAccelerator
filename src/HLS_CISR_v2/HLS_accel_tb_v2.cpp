#define num_slots 4
#define N 8
#define num_non_zero 16
//#include "encoded_data.h"
#include<stdio.h>
#include<math.h>
#include<stdbool.h>
#include "HLS_accel_v2.h"
//RUNS ON HOST
int main()
{

	int row_count = 0;

	//Initialize inp vec
	float inp_vec [] = { 0,1,1,1,0,0,1,1};
	//Initialize out vec
	float out_vec [] = {0,0,0,0,0,0,0,0};

	//for(int i=0;i<8;i++)
	//{
//		printf("inp_vec %f\n",inp_vec[i]);

	//}

	//printf("%f\n",sparse_mat[0].data);
	HLS_accel_v2(
					//Inp vector
					inp_vec,
					//Full sparse matrix
				//	sparse_mat,
					//Full row len array
				//	row_len_arr,
					//Outputs
					out_vec
			);


	//Test out_vec now
    /*
1	0.3
2	-32.5
3	0
4	6.2
5	20.8
6	14.7
7	55.6
8	17.6
      */

	float res_expected []={0.3,-32.5,0,6.2,20.8,14.7,55.6,17.6};
	bool correct = true;
	float err_lim = 0.1;
	for(int i1=0;i1<8;i1++)
	{
		correct = correct & (abs(out_vec[i1]-res_expected[i1])<err_lim);
		printf("out_val[%d] =  %f\n",i1,out_vec[i1]);
	}



	if(correct)
		return 0;
	else
		return 1;










}
