import java.io.*;

class StringMatchTest {
	public static void main(String[] args){
	
		int count = 0;
		int hitRate = 0;
	
		try{
			File tags = new File("tag.txt");
			File titles = new File("title.txt");
			
			BufferedReader buf_tags = new BufferedReader (new FileReader(tags));
			BufferedReader buf_titles = new BufferedReader(new FileReader(titles));

			String tag = "";

			while((tag = buf_tags.readLine()) != null){
			
				char tagAry[] = tag.toCharArray();
				
				String title = "";
			
				while((title = buf_titles.readLine()) != null){

					char titleAry[] = title.toCharArray();
					
					for(char tagChar: tagAry){
						for(char titleChar: titleAry){
							if(tagChar == titleChar){
								count += 1;
								break;
							}
						}
					}
					
					hitRate = count / titleAry.length * 100;
					
					if(hitRate == 100){
						System.out.println(hitRate);
					}
					
					count = 0;
				}
				
			}
			
			buf_tags.close();
			buf_titles.close();
			
		}catch(IOException e){
			System.out.println(e);
		}
		
	}
}