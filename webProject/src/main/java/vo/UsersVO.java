package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UsersVO {
	int user_no;
	String id;
	String pw;
	String nickname;
	String name;
	String email;
	String birth;
	String gender;
	String mailok;
	int grade;
	int status;
}
