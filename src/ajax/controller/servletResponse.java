package ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajax.model.ClassVO;
import ajax.model.UserVO;

public class servletResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public servletResponse() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		/*************************** 1.�����ШD�Ѽ� ****************************************/
		String action = req.getParameter("action");
		String gradeId = req.getParameter("gradeId");
		String classId = req.getParameter("classId");
		// �B�z�T���ʺA����ư϶�
		if ("getSelect".equals(action)) {
			try {
			List<ClassVO> classList = null;
			List<UserVO> userlist = null;
			// �d�ߦ~�šB�Z�Ź����P�Ǹ�ư϶�
			if (!"-1".equals(classId)) {
				/*************************** 2.�}�l�d�߸�� ****************************************/
				/* ���@�϶�����service�h��Ʈw�̦~�šB�Z�Ŭd�ߨ��o */
				
				if ("AA101".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�ժ���");
					user1.setNameId("1001");
					user1.setClassId("AA101");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("������");
					user2.setNameId("1002");
					user2.setClassId("AA101");
					userlist.add(user2);

					UserVO user3 = new UserVO();
					user3.setName("������");
					user3.setNameId("1003");
					user3.setClassId("AA101");
					userlist.add(user3);
				}
				if ("AA102".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�զV�鸪");
					user1.setNameId("1004");
					user1.setClassId("AA102");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("���V�鸪");
					user2.setNameId("1005");
					user2.setClassId("AA102");
					userlist.add(user2);
				}
				if ("AB101".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�i���p");
					user1.setNameId("1006");
					user1.setClassId("AB101");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("��l�p");
					user2.setNameId("1007");
					user2.setClassId("AB101");
					userlist.add(user2);
				}
				if ("AB102".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�ԩ�");
					user1.setNameId("1008");
					user1.setClassId("AB102");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("���");
					user2.setNameId("1009");
					user2.setClassId("AB102");
					userlist.add(user2);
				}
				if ("AB103".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("����");
					user1.setNameId("1010");
					user1.setClassId("AB103");
					userlist.add(user1);
				}
				if ("AC101".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�֥d�C1��");
					user1.setNameId("1011");
					user1.setClassId("AC101");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("�֥d�C2��");
					user2.setNameId("1012");
					user2.setClassId("AC101");
					userlist.add(user2);
				}
				/*---------------------------------------------*/
			} 
			if(!"-1".equals(gradeId)){
				
				/* ���@�϶�����service�h��Ʈw�̦~�šB�Z�Ŭd�ߨ��o */
				
				if ("grade1".equals(gradeId)) {
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AA101");
					cls1.setClassName("�����Z");
					cls1.setGradeId("grade1");
					classList.add(cls1);

					ClassVO cls2 = new ClassVO();
					cls2.setClassId("AA102");
					cls2.setClassName("�V�鸪�Z");
					cls2.setGradeId("grade1");
					classList.add(cls2);
				}
				if ("grade2".equals(gradeId)) {
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AB101");
					cls1.setClassName("�p�p�Z");
					cls1.setGradeId("grade2");
					classList.add(cls1);

					ClassVO cls2 = new ClassVO();
					cls2.setClassId("AB102");
					cls2.setClassName("�L�L�Z");
					cls2.setGradeId("grade2");
					classList.add(cls2);

					ClassVO cls3 = new ClassVO();
					cls3.setClassId("AB103");
					cls3.setClassName("�N�N�Z");
					cls3.setGradeId("grade2");
					classList.add(cls3);
				}
				if ("grade3".equals(gradeId)) {
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AC101");
					cls1.setClassName("�֥d�C�Z");
					cls1.setGradeId("grade3");
					classList.add(cls1);
				}
				/*---------------------------------------------*/
			}
			
			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
			System.out.println(action);
			req.setAttribute("classList", classList);    // ��Ʈw���X������,�s�Jrequest scope
			req.setAttribute("userList", userlist);      // ��Ʈw���X������,�s�Jrequest scope
			RequestDispatcher successView = req.getRequestDispatcher("/selectChange.jsp");
			successView.forward(req, res);
			
			/*************************** ��L�i�઺���~�B�z ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
			
//			res.setContentType("text/plain");
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			out.write(array.toString());
//			out.flush();
//			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
