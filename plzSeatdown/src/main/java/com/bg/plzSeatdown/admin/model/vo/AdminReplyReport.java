package com.bg.plzSeatdown.admin.model.vo;

public class AdminReplyReport {
	
	private int replyReportNo;
	private String replyReportContent;
	private int replyNo;
	private int memberSuspector;
	private int memberReporter;
	private String reportCategoryName;
	private char reportStatus;
	private String suspectorId;
	private String reporterId;
	
	public AdminReplyReport() {}

	public AdminReplyReport(int replyReportNo, String replyReportContent, int replyNo, int memberSuspector,
			int memberReporter, String reportCategoryName, char reportStatus, String suspectorId, String reporterId) {
		super();
		this.replyReportNo = replyReportNo;
		this.replyReportContent = replyReportContent;
		this.replyNo = replyNo;
		this.memberSuspector = memberSuspector;
		this.memberReporter = memberReporter;
		this.reportCategoryName = reportCategoryName;
		this.reportStatus = reportStatus;
		this.suspectorId = suspectorId;
		this.reporterId = reporterId;
	}

	public int getReplyReportNo() {
		return replyReportNo;
	}

	public void setReplyReportNo(int replyReportNo) {
		this.replyReportNo = replyReportNo;
	}

	public String getReplyReportContent() {
		return replyReportContent;
	}

	public void setReplyReportContent(String replyReportContent) {
		this.replyReportContent = replyReportContent;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getMemberSuspector() {
		return memberSuspector;
	}

	public void setMemberSuspector(int memberSuspector) {
		this.memberSuspector = memberSuspector;
	}

	public int getMemberReporter() {
		return memberReporter;
	}

	public void setMemberReporter(int memberReporter) {
		this.memberReporter = memberReporter;
	}

	public String getReportCategoryName() {
		return reportCategoryName;
	}

	public void setReportCategoryName(String reportCategoryName) {
		this.reportCategoryName = reportCategoryName;
	}

	public char getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(char reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getsuspectorId() {
		return suspectorId;
	}

	public void setsuspectorId(String suspectorId) {
		this.suspectorId = suspectorId;
	}

	public String getReporterId() {
		return reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	@Override
	public String toString() {
		return "AdminReplyReport [replyReportNo=" + replyReportNo + ", replyReportContent=" + replyReportContent
				+ ", replyNo=" + replyNo + ", memberSuspector=" + memberSuspector + ", memberReporter=" + memberReporter
				+ ", reportCategoryName=" + reportCategoryName + ", reportStatus=" + reportStatus + ", suspectorId="
				+ suspectorId + ", reporterId=" + reporterId + "]";
	}

}
