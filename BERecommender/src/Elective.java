
public class Elective {

	private String code;
	private String name;
	private String stream;
	private String setf;
	private String setp;
	private String type;
	private String prg;
	private String mode;
	private String preq;
	private String cf;
	
	public String getCf() {
		return cf;
	}
	public void setCf(String cf) {
		float percentage = Float.parseFloat(cf) * 100;
		this.cf = percentage + "%";
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public String getSetf() {
		return setf;
	}
	public void setSetf(String setf) {
		this.setf = setf;
	}
	public String getSetp() {
		return setp;
	}
	public void setSetp(String setp) {
		this.setp = setp;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrg() {
		return prg;
	}
	public void setPrg(String prg) {
		this.prg = prg;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getPreq() {
		return preq;
	}
	public void setPreq(String preq) {
		this.preq = preq;
	}
	@Override
	public String toString() {
		
		return String
				.format("%-10s %-30s %-3s %-7s %-7s %-12s %-10s %-10s %-16s %-3s",
						code, name, stream, setf, setp, type, prg, mode, preq, cf);
		
	}
	
	
}
