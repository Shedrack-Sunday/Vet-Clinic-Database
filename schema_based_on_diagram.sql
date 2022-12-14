CREATE DATABASE clinic;

CREATE TABLE patients (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL NOT NULL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(255) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE treatments (
  id SERIAL NOT NULL PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE invoices (
  id SERIAL NOT NULL PRIMARY KEY,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP,
  medical_history_id INT NOT NULL,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);

CREATE TABLE invoice_items (
  id SERIAL NOT NULL PRIMARY KEY,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT NOT NULL,
  FOREIGN KEY (invoice_id) REFERENCES invoices (id),
  treatment_id INT NOT NULL,
  FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

-- To create the many to many relationship between medical_histories and treatments
CREATE TABLE histories_treatments (
  history_id INT REFERENCES medical_histories(id) ON DELETE CASCADE,
  treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE INDEX patients_id ON patients(id);
CREATE INDEX medical_histories_id ON medical_histories(id);
CREATE INDEX invoices_id ON invoices(id);
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX treatments_id ON treatments(id);
CREATE INDEX histories_treatments_history_id ON histories_treatments(history_id);
CREATE INDEX histories_treatments_treatment_id ON histories_treatments(treatment_id);
