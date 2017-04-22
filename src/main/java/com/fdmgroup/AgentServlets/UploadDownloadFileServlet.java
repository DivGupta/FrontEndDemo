package com.fdmgroup.AgentServlets;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fdm.frontEndFuntionality.FunctionalityFactory;
import com.fdm.users.Publisher;

@WebServlet("/upDown")
@MultipartConfig
public class UploadDownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
		if (fileName == null || fileName.equals(""))
			throw new ServletException("File Name can't be null or empty");
		File file = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + fileName);
		if (!file.exists())
			throw new ServletException("File doesn't exists on server.");
		System.out.println("File location on server::" + file.getAbsolutePath());
		ServletContext ctx = getServletContext();
		InputStream fis = new FileInputStream(file);
		String mimeType = ctx.getMimeType(file.getAbsolutePath());
		response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		ServletOutputStream os = response.getOutputStream();
		byte[] bufferData = new byte[1024];
		int read = 0;
		while ((read = fis.read(bufferData)) != -1)
			os.write(bufferData, 0, read);
		os.flush();
		os.close();
		fis.close();
		System.out.println("File downloaded at client successfully");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String comp = new String();

		List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName()))
				.collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
		Publisher author = (Publisher) request.getSession().getAttribute("loggedInUser");
		for (Part filePart : fileParts) {
			String fileNameTheirs = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String fileNameOurs = author.getName() + "_" + request.getParameter("title");

			File file = new File(request.getServletContext().getAttribute("FILES_DIR") + "",
					fileNameOurs + "_" + fileNameTheirs);

			try (InputStream fileContent = filePart.getInputStream()) {
				Files.copy(fileContent, file.toPath());
				comp = comp + file.toPath() + ":::";
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		// length, title genre, desc, path

		FunctionalityFactory.getPublisher().createBook(author, request.getParameter("length"),
				request.getParameter("title"), request.getParameter("genre"), request.getParameter("descrip"), comp);

		response.sendRedirect("addBook.jsp");

		// Main.createBook(author, request.getParameter("title"), request.getParameter("genre"),
		// request.getParameter("length"));
		// String saveFile = new String();
		// String contentType = request.getContentType();
		// System.out.println(contentType);
		// if ((contentType != null && (contentType.indexOf("multipart/form-data") >= 0))) {
		//
		// DataInputStream in = new DataInputStream(request.getInputStream());
		//
		// int formDataLength = request.getContentLength();
		// byte dataBytes[] = new byte[formDataLength];
		// int byteRead = 0;
		// int totalBytesRead = 0;
		//
		// while (totalBytesRead < formDataLength) {
		// byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
		// totalBytesRead += byteRead;
		// }
		//
		// String file = new String(dataBytes);
		//
		// saveFile = file.substring(file.indexOf("filename=\"") + 10);
		// saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		// saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
		//
		// int lastIndex = contentType.lastIndexOf("-");
		// String boundary = contentType.substring(lastIndex + 1, contentType.length());
		// int pos;
		//
		// pos = file.indexOf("filename=\"");
		//
		// pos = file.indexOf("\n", pos) + 1;
		// pos = file.indexOf("\n", pos) + 1;
		// pos = file.indexOf("\n", pos) + 1;
		//
		// int boundaryLocation = file.indexOf(boundary, pos) - 4;
		//
		// int startPos = ((file.substring(0, pos)).getBytes()).length;
		// int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		//
		// saveFile = request.getServletContext().getAttribute("FILES_DIR") + request.getParameter("title") + "_"
		// + request.getParameter("author") + "_" + saveFile;
		// System.out.println(saveFile);
		//
		// File ff = new File(saveFile);
		// try {
		// FileOutputStream fileOut = new FileOutputStream(ff);
		// fileOut.write(dataBytes, startPos, (endPos - startPos));
		// fileOut.flush();
		// fileOut.close();
		// response.sendRedirect("addBook.jsp");
		// } catch (Exception e) {
		// System.out.println(e);
		// }
		// }
	}

}