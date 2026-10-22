package study.j0918;

public class Test1 {
	public static void main(String[] args) {
		int i = 0, tot = 0;
		
		while(i < 10) {
			i++;
			tot += i;
		}
		System.out.println("1~10까지의 합은 " + tot);
	}
}
