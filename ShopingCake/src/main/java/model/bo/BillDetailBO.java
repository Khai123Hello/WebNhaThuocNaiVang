package model.bo;

import java.util.ArrayList;

import model.bean.BillDetailsFull;
import model.dao.BillsDetailDAO;

public class BillDetailBO {
	BillsDetailDAO s = new BillsDetailDAO();
	// get chi tiết hóa đơn theo mã hóa đơn

	public ArrayList<BillDetailsFull> getBillDetailFullById(long idHoaDon) {
		return s.getBillDetailFullById(idHoaDon);
	}
}
