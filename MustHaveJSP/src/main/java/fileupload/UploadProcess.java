package fileupload;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/13FileUpload/UploadProcess.do")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 1,           // 1MB
    maxRequestSize = 1024 * 1024 * 10        // 10MB
)
public class UploadProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
                          throws ServletException, IOException {
        try {
            String saveDirectory =
                getServletContext().getRealPath("/Uploads");

            String originalFileName =
                FileUtil.uploadFile(req, saveDirectory);

            String savedFileName =
                FileUtil.renameFile(saveDirectory, originalFileName);

            insertMyFile(req, originalFileName, savedFileName);

            resp.sendRedirect("FileList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "파일 업로드 오류");
            req.getRequestDispatcher("FileUploadMain.jsp")
               .forward(req, resp);
        }
    }

    private void insertMyFile(HttpServletRequest req,
                              String oFileName, String sFilename) {
        String title = req.getParameter("title");
        String[] catearray = req.getParameterValues("cate");

        StringBuffer cateBuf = new StringBuffer();
        if (catearray == null) {
            cateBuf.append("선택한 항목 없음");
        } else {
            for (String s : catearray) {
                cateBuf.append(s).append(", ");
            }
        }

        System.out.println("파일외 품값: " + title + "\n" + cateBuf);

        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(oFileName);
        dto.setSfile(sFilename);

        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();
    }
}

