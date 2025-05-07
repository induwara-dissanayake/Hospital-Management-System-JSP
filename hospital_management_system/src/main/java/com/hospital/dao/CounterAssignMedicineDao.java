package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hospital.model.ClinicOrder;
import com.hospital.model.ClinicPrescription;
import com.hospital.model.OPDOrder;
import com.hospital.model.OPDPrescription;
import com.hospital.model.Prescription;
import com.hospital.util.DBConnection;

public class CounterAssignMedicineDao {

	private ClinicOrder mapResultSetToClinicOrder(ResultSet rs) throws SQLException {
		ClinicOrder order = new ClinicOrder();
		order.setId(rs.getInt("id"));
		order.setTolkenNo(rs.getInt("tolken_no"));
		order.setClinicId(rs.getInt("clinic_id"));
		order.setPatientId(rs.getInt("patient_id"));
		order.setDate(rs.getTimestamp("date"));
		order.setDoctorComplete(rs.getInt("doctor_complete"));
		order.setCounterComplete(rs.getInt("counter_complete"));
		return order;
	}

	public ArrayList<ClinicOrder> getAllClinicOrders() {
		ArrayList<ClinicOrder> orderList = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM reception_patient_clinic_records where doctor_complete =1 and counter_complete=0";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ClinicOrder order = mapResultSetToClinicOrder(rs);
				orderList.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderList;
	}

	public ArrayList<OPDOrder> getAllOpdOrders() {
		ArrayList<OPDOrder> patientList = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM reception_patient_opd_record where doctor_complete =1 and counter_complete=0";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				OPDOrder order = new OPDOrder();
				order.setId(rs.getInt("id"));
				order.setPatientName(rs.getString("patient_name"));
				order.setPatientAge(rs.getInt("patient_age"));
				order.setTolkenNo(rs.getInt("tolken_no"));
				order.setDoctorComplete(rs.getInt("doctor_complete"));
				order.setCounterComplete(rs.getInt("counter_complete"));
				patientList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return patientList;
	}

	public List<OPDPrescription> selectByOrderId(int orderId) throws ClassNotFoundException {
		List<OPDPrescription> prescriptions = new ArrayList<>();
		String sql = "SELECT * FROM doctor_patient_prescription_opd WHERE order_id = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, orderId);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					OPDPrescription prescription = new OPDPrescription();
					prescription.setOrderId(rs.getInt("order_id"));
					prescription.setDoctorId(rs.getInt("doctor_id"));
					prescription.setPrescriptionId(rs.getInt("prescription_id"));
					prescription.setRoutine(rs.getInt("routine"));
					prescription.setQty(rs.getInt("qty"));
					prescription.setDays(rs.getInt("days"));

					prescriptions.add(prescription);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return prescriptions;
	}

	public List<ClinicPrescription> selectByOrderIdclinic(int orderId) throws ClassNotFoundException {
		List<ClinicPrescription> prescriptions = new ArrayList<>();
		String sql = "SELECT * FROM doctor_patient_prescription_clinic WHERE order_id = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, orderId);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					ClinicPrescription prescription = new ClinicPrescription();
					prescription.setOrderId(rs.getInt("order_id"));
					prescription.setDoctorId(rs.getInt("doctor_id"));
					prescription.setPatient_id(rs.getInt("patient_id"));
					prescription.setClinic_id(rs.getInt("clinic_id"));
					prescription.setPrescriptionId(rs.getInt("prescription_id"));
					prescription.setRoutine(rs.getInt("routine"));
					prescription.setQty(rs.getInt("qty"));
					prescription.setDays(rs.getInt("days"));

					prescriptions.add(prescription);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return prescriptions;
	}

	public Map<Integer, Prescription> getPrescriptionDetails(List<?> prescriptions) throws ClassNotFoundException {
		Map<Integer, Prescription> prescriptionDetails = new HashMap<>();
		String sql = "SELECT * FROM doctor_prescription WHERE id = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			for (Object prescription : prescriptions) {
				int prescriptionId;
				if (prescription instanceof OPDPrescription) {
					prescriptionId = ((OPDPrescription) prescription).getPrescriptionId();
				} else if (prescription instanceof ClinicPrescription) {
					prescriptionId = ((ClinicPrescription) prescription).getPrescriptionId();
				} else {
					continue;
				}

				ps.setInt(1, prescriptionId);
				try (ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						Prescription prescriptionDetail = new Prescription();
						prescriptionDetail.setId(rs.getInt("id"));
						prescriptionDetail.setPrescription(rs.getString("prescription"));
						prescriptionDetail.setType(rs.getString("type"));
						prescriptionDetails.put(prescriptionId, prescriptionDetail);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return prescriptionDetails;
	}

	public void completeOrder(int orderId, int type, String[] selectedPrescriptions) throws SQLException, ClassNotFoundException {
		String tableName = type == 1 ? "reception_patient_opd_record" : "reception_patient_clinic_records";
		String sql = "UPDATE " + tableName + " SET counter_complete = 1 WHERE id = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, orderId);
			ps.executeUpdate();
		}
	}
}