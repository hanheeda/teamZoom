package vo;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RecommendTravelVO {
	int rc_no;
	int city_no;
	String small_img;
	String big_img;
}
