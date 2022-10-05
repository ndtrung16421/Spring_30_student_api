package com.example.Student_client;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class StudentController {
	
	
	 //findAll
	@GetMapping("/student")
	public String getAll() {
		
		
		
		return "student";
	}
	 //findAll
		@GetMapping("/")
		public String getAll1() {		
			return "redirect:/Calendar";
		}
		
	@GetMapping("/Calendar")
	public String Calendar() {
		
		
		
		return "calendar";
	}
	
	@GetMapping("/AddTask")
	public String addTask() {
		
		
		
		return "addTask";
	}
	
	
	@GetMapping("/about")
	public String getAllaa() {
		
		return "about";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/Register")
	public String Register() {
		return "Register";
	}
	
	//get add student
	@GetMapping("/add")
	public String create() {
		return "add-student";
	}
	
	@GetMapping("/update/{id}")
	public String update() {
		return "update-student";
	}

	@GetMapping("/delete/{id}")
	public String delete() {
		return "delete-student";
	}
}
	//post add student
//	@PostMapping("/add")
//	public String create(@ModelAttribute("student") Student student) {
//		student = studentService.create(student);
//		return "redirect:/student";
//	}
//	
	// get update student
//	@GetMapping("/update/{id}")
//	public String update(@PathVariable("id") Integer id, Model model) {
//		Optional<Student> optionals = studentService.findById(id);
//		Student student = optionals.get();
//		
//		model.addAttribute("student",student);
//		return "update-student";
//	}
	
	// post update student
//	@PostMapping("/update")
//	public String update(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("age") int age,@RequestParam("address") String address) {
//		Optional<Student> optionals = studentService.findById(id);
//		Student student2 = optionals.get();
//		
//		student2.setName( name );
//		student2.setAge( age );
//		student2.setAddress( address );
//		
//		student2 = studentService.update(student2);
//		return "redirect:/student";
//	}
	
	//get delete
//	@GetMapping("/delete/{id}")
//	public String delete(@PathVariable("id") Integer id) {
//		studentService.delete(id);
//		return "redirect:/student";
//	}
	
	//export pdf
//	@RequestMapping(value = "/pdfview",method = RequestMethod.GET)
//	public ResponseEntity<byte[]> download() throws IOException{
//		List<Student> studentList = studentService.findAll();
//		String path = "/target/pdf/student.pdf";
//		File file = new File(path);
//		file.getParentFile().mkdirs();
//		
//		//Initialize PDF writer
//		PdfWriter writer = new PdfWriter(path);
//		//Initialize PDf document
//		PdfDocument pdf = new PdfDocument(writer);
//		//Initialize document
//		Document document = new Document(pdf);
//		//Paragraph
//		Paragraph header = new Paragraph("Danh Sach Sinh Vien");
//		header.setTextAlignment(TextAlignment.CENTER)
//			.setFontSize(30)
//			.setBold()
//			.setMarginBottom(10);
//		Paragraph username = new Paragraph("....................");
//		username.setTextAlignment(TextAlignment.CENTER);
//		//date 
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("E dd.MM.yyyy 'at' hh:mm:ss a");
//		Date date = new Date();
//		Paragraph dateTime = new Paragraph(simpleDateFormat.format(date));
//		dateTime.setTextAlignment(TextAlignment.RIGHT)
//			.setMarginBottom(30);
////		//image
////		ImageData imageData = ImageDataFactory.create(servletC)
//		Table headerInfo = new Table(2);
//		headerInfo.addCell(new Cell(1, 1).setBorder(Border.NO_BORDER));
//		Table headerInfoTable = new Table(2); 
//		//table base structure
//		float[] pointColumnWidths = {80F, 130F, 130F, 130F};
//		Table table = new Table(pointColumnWidths);
//		table.setHorizontalAlignment(HorizontalAlignment.CENTER);
//		
//		Color color = WebColors.getRGBColor("silver");
//		
//		Cell cell = new Cell(1,4).setBorder(Border.NO_BORDER);
//		table.addCell(cell);
//		cell = new Cell(1,1)	
//				.setTextAlignment(TextAlignment.CENTER)
//				.setBackgroundColor(color)
//				.add(new Paragraph("ID"));
//		table.addCell(cell);
//		cell = new Cell(1,1)
//				.setTextAlignment(TextAlignment.CENTER)
//				.setBackgroundColor(color)
//				.add(new Paragraph("Name"));
//		table.addCell(cell);
//		cell = new Cell(1,1)
//				.setTextAlignment(TextAlignment.CENTER)
//				.setBackgroundColor(color)
//				.add(new Paragraph("Age"));
//		table.addCell(cell);
//		cell = new Cell(1,1)
//				.setTextAlignment(TextAlignment.CENTER)
//				.setBackgroundColor(color)
//				.add(new Paragraph("Address"));
//		table.addCell(cell);
//		//student data
//		for(Student student : studentList)
//		{
//			cell = new Cell(1,1)
//					.setTextAlignment(TextAlignment.CENTER)
//					.add(new Paragraph("SV-"+student.getId()));
//			table.addCell(cell);
//			cell = new Cell(1,1)
//					.setTextAlignment(TextAlignment.CENTER)
//					.add(new Paragraph(student.getName()));
//			table.addCell(cell);
//			cell = new Cell(1,1)
//					.setTextAlignment(TextAlignment.CENTER)
//					.add(new Paragraph(""+student.getAge()));
//			table.addCell(cell);
//			cell = new Cell(1,1)
//					.setTextAlignment(TextAlignment.CENTER)
//					.add(new Paragraph(""+student.getAddress()));
//			table.addCell(cell);
//		}
//		//Add table to the document 
//		document.add(username);
//		document.add(header);
//		document.add(table);
//		//Close document
//		document.close();
//		
//		byte[]contents = Files.readAllBytes(file.toPath());
//		
//		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
//		headers.setContentType(org.springframework.http.MediaType.APPLICATION_PDF);
//		//Here you have to set the actual filename of your pdf
//		String filename = "student.pdf";
//		headers.setContentDispositionFormData(filename, filename);
//		headers.setCacheControl("must-revalidate, post-check=0,pre-check=0");
//		ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(contents,headers,HttpStatus.OK);
//		return response;
//	}
//}
