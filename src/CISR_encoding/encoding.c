#include <stdio.h>
#include <math.h>
//Assume N*N tile for now
#define N 8
#define num_non_zero 16
#define num_slots 4
const float matrix[][8] = {
{0.2,0   ,0 ,0.3  ,0   ,0    ,0   ,0},
{0  ,0   ,0 ,-32.5,0   ,0    ,0   ,0},
{0  ,0   ,0 ,0    ,25.2,100.2,0   ,0},
{0  ,0.80,0 ,0    ,0   ,1.2  ,0   ,5.4},
{0  ,0   ,12.6,0    ,0   ,0    ,1.5 ,6.7},
{0  ,0   ,0 ,5.4  ,0   ,0    ,0   ,9.3},
{0  ,55.6,0 ,0    ,0   ,1.2  ,0   ,0},
{0  ,0   ,0 ,0    ,0   ,0    ,17.6,0}
};

//TODO- can either implement encoded data in linked list/ array ( will need to know number of non-zeros before hand
//TODO- ** Figure out how row id decoding is done- esp with empty rows **
struct elem
{
 float value;
 int col_index;
};
int main()
{
  /*Test matrix print
  for(int i = 0;i<N;i++)
  {
    for( int j=0;j<N;j++)
    {
      printf(" %f ",matrix[i][j]); 
      
    }
    printf("\n");
  }*/
  
  //Declare array of structures- assuming scheduling is done by host core or by sequentially going through elements
    
  struct elem Elem_arr[num_non_zero];
  //To keep track of non-zeros encoded
  int non_zero_count = 0;
  //To keep track of non-zeros done so far in each slot
  int slot_non_zeros_done[num_slots]; 
  //To keep track of which row the slot is working on
  int slot_row_index[num_slots];
  //To keep track of last elem's col index that slot had encoded
  int slot_col_index_last[num_slots];
  for(int i = 0;i<num_slots;i++)
  {
    slot_non_zeros_done[i] = 0;
    slot_row_index[i] = 0;
    slot_col_index_last[i] =-1;
  }
  //Row on which given slot is working on
  
  
  
  //To make things simple, figure out number of non-zeros in each row
  //TODO- can find total nonzeros here itself
  
  int num_non_zero_in_row[N];
  for(int i = 0;i<N;i++)
  {
    num_non_zero_in_row[i] = 0;
    for(int j=0;j<N;j++)
    {
      if(matrix[i][j]!=0)
      {
        num_non_zero_in_row[i]++;
      
      }
    
    }
  }
  
  //Row map - for mapping rows to slots
  int row_map[N];
  for(int i=0;i<N;i++)
  {
    row_map[i] = -1;
  }
  
  //Slot number
  int slot_num = 0;
  
  //Useful in finding the next un-touched row that can be mapped to some slot 
  int global_max_row= -1;
  while(non_zero_count<num_non_zero)
  {
      printf("non zero count %d\n",non_zero_count);
      //Row id for that slot
      int row_id = slot_row_index[slot_num];
      int col_index = slot_col_index_last[slot_num]+1;
      printf("Row_id %d Col_index %d\n",row_id, col_index);
      
      //if(non_zero_count==1)
      //  while(1==1);
              
      //Already mapped row to current slot
      if(row_map[row_id] == slot_num)
      {
        
        //If slot is still pending on that row and that row is worth working on- ie, atleast one non-zero elem
        if(slot_non_zeros_done[slot_num]<num_non_zero_in_row[row_id])
        {
          //It encodes next non-zero in that row for the slot (if any)
          while(col_index<N)
          {
            printf("Col index %d\n",col_index);
              
            if(matrix[row_id][col_index]!=0)
            { 
              //Encode
              Elem_arr[non_zero_count].value = matrix[row_id][col_index];
              Elem_arr[non_zero_count].col_index = col_index;
              //Elem_arr[non_zero_count].row_length = num_non_zero_in_row[row_id];
              non_zero_count++;
              slot_non_zeros_done[slot_num]++;
              slot_col_index_last[slot_num] = col_index;
              printf("Encoded !\n");
              
              //Go to next slot
              slot_num++;
              slot_num = slot_num%num_slots;
              break;
            }
            col_index++; 
          }
        }
        //Slot is done with that row, now can go to new row
        else
        {
          //Reset some vars
          slot_non_zeros_done[slot_num] = 0;
          slot_col_index_last[slot_num] =-1;
          //New row index
          slot_row_index[slot_num] = global_max_row + 1;
        }
      }
      //The slot is done with that row, can proceed to next latest un-touched row and map it
      //or, the current row is empty so it skips it
      //If row is unmapped
      else if(row_map[row_id] == -1) 
      {
        printf("Unmapped row %d\n",row_id);
        
        //Mapping process
        //Whenever a new row is mapped update global_max_row id
        if(num_non_zero_in_row[row_id] !=0)
        {
          if(row_id > global_max_row)
            global_max_row = row_id;
          row_map[row_id] = slot_num; 
          printf("Mapped row %d to slot %d\n",row_id,slot_num); 
          
        }
        //Else, don't map and go ahead search again
        else
        {
          slot_row_index[slot_num]++;
          
        }
      
      }
      //If row is not mapped to current slot- (mapped to another slot) then just go ahead
      else  
      {
        slot_row_index[slot_num]++;
      }
      
      //End of every slot processing find the global max row id that any slot is working on
    
    
     
  }
  
  
  //Test output
  int row_len_arr_index= 0;
  for(int index = 0;index<num_non_zero;index++)
  {
    printf("Val:       %f \n",Elem_arr[index].value);
    printf("Col_index: %d \n",Elem_arr[index].col_index);
    if(row_len_arr_index<
    printf("Row_len:   %d \n",row_len_arr[);
    printf("------------------------------\n");
  }
  
  
  
  
}


