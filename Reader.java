package ����;

import java.io.*;

public class Reader extends Thread {
	
	public static void main(String args[]){

		FileReader fread = null;
		FileWriter fwrite = null ;
		
		BufferedReader bread = null ;
		BufferedWriter bwrite = null ;
		
		try{
			fread = new FileReader("C:\\Users\\dyshi\\Documents\\īī���� ���� ����\\����������.csv");
			bread = new BufferedReader(fread);
	
			fwrite = new FileWriter("C:\\Users\\dyshi\\Documents\\īī���� ���� ����\\�޿�.txt", true);
			bwrite = new BufferedWriter(fwrite);
			
			String s;
			while((s=bread.readLine())!=null){
				bwrite.write(s);
				sleep(100);
				bwrite.newLine();
			}	
		}catch(Exception e){
			
			e.printStackTrace();
		
		}finally{
			
			if(bread != null) 
				try{
					bread.close();
				}catch(IOException e){
				
			}
			if(fread != null)
				try{
					fread.close();
					}catch(IOException e){
						
					}
			
			if(bwrite != null) 
				try{
					bwrite.close();
					}catch(IOException e){
				
			}
			if(fwrite != null) 
				try{
					fwrite.close();
					}catch(IOException e){
						
					}
		}	
	}
}