package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class BoardListVO {
	int board_no;
	int user_no;
	int city_no;
	int detail_option_no;
	String regdate;
	String title;
	String contents;
	int hits;
	int recommend_cnt;
	int report_cnt;
	int status;
	String comment;
	String hide_date;

}
