-- open a connection
USE CATAN_DB;

-- create the XML_CCS table
CREATE TABLE XML_CCS (
	prog_id CHAR(4) NOT NULL PRIMARY KEY,
	prog_name VARCHAR(50) NOT NULL,
	stud_dtls XML
);

-- insert into the XML_CCS table
INSERT INTO XML_CCS VALUES
('BSCS', 'Bachelor of Science in Computer Science', '<CS_Students>
														<Student Class_No="9">
															<Name>
																<Last>Catan</Last>
																<First>Diether</First>
															</Name>
															<Contacts>
																<Phone>12345678901</Phone>
																<Email>catandiet@uc.ccs.ph</Email>
															</Contacts>
														</Student>
														<Student Class_No="17">
															<Name>
																<Last>Godinez</Last>
																<First>Alexia Chloe</First>
															</Name>
															<Age>19</Age>
															<Contacts>
																<Phone>98765432101</Phone>
																<Email>godilex@uc.ccs.ph</Email>
															</Contacts>
														</Student>
													</CS_Students>'),
('BSIT', 'Bachelor of Science in Information Technology', ' <IT_Students>
																<Student Class_No="22">
																	<Name>
																		<Last>Jaca</Last>
																		<First>Kissia Mae</First>
																	</Name>
																	<Status>Kaminyo-on</Status>
																	<Contacts>
																		<Phone>14344524652</Phone>
																		<Email>jacissia@uc.ccs.ph</Email>
																	</Contacts>
																	</Student>
																	<Student Class_No="17">
																		<Name>
																			<Last>Duragab</Last>
																			<First>Herdenn</First>
																		</Name>
																		<Contacts>
																			<Phone>25814736934</Phone>
																			<Email>durasheys@uc.ccs.ph</Email>
																		</Contacts>
																	</Student>
																</IT_Students>'),
('BSIS', 'Bachelor of Science in Information Systems', '<IS_Students>
															<Student Class_No="3">
																<Name>
																	<Last>Ferrater</Last>
																	<First>Geroseline</First>
																</Name>
																<Ambition>Fire Woman</Ambition>
																<Contacts>
																	<Phone>96314785205</Phone>
																	<Email>ferraline@uc.ccs.ph</Email>
																</Contacts>
															</Student>
															<Student Class_No="20">
																<Name>Kamuti Kent</Name>
																<Address>
																	<City>Way Laro</City>
																	<Prov>Mas Way Laro</Prov>
																</Address>
																<Contacts>
																	<Phone>65498712374</Phone>
																</Contacts>
																<MoGraduate>Depende</MoGraduate>
															</Student>
														</IS_Students>');

-- display the XML_CCS table
SELECT * FROM XML_CCS;