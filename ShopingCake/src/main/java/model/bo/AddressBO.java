/**
*Project name: ShopBanHang
*Version : 1.0
*Created date : 14 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bo;

import java.util.ArrayList;

import model.bean.Quan_Huyen;
import model.bean.Tinh_ThanhPho;
import model.bean.Xa_Phuong;
import model.dao.AddressDAO;

/**
 * @author MyPC
 *
 */
public class AddressBO {
	//
	AddressDAO s = new AddressDAO();

	// Lấy toàn bộ tỉnh thành phố
	public ArrayList<Tinh_ThanhPho> getTinhThanhPho(){
		return s.getTinhThanhPho();
	}
	// Lấy toàn bộ quận/ huyện theo id tỉnh
	public ArrayList<Quan_Huyen> getQuanHuyenById(long idTinhTP) {
		return s.getQuanHuyenById(idTinhTP);
	}

	// Lấy toàn bộ xã phường theo id huyện
	public ArrayList<Xa_Phuong> getXaPhuongById(long idQuanHuyen){
		return s.getXaPhuongById(idQuanHuyen);
	}

}
