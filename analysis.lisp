(defun data (filename)
  "Return a list of numerical values from DATA-FILE."
  (with-open-file (stream filename :direction :input)
    (read (make-concatenated-stream
	   (make-string-input-stream "(")
	   stream
	   (make-string-input-stream ")")))))

(defun expectancy (value average)
  "Return the expectancy of VALUE with respect to AVERAGE."
  (expt (- value average) 2))

(defgeneric ratios (data1 data2)
  (:documentation "Return the ratios of DATA1 / DATA2.")
  (:method ((numbers1 list) (numbers2 list))
    "Return the ratios of NUMBERS1 / NUMBERS2."
    (mapcar #'/ numbers1 numbers2))
  (:method ((filename1 pathname) (filename2 pathname))
    "Return the ratios of lists of numbers from FILENAME1 / FILENAME2."
    (ratios (data filename1) (data filename2))))

(defgeneric average (data)
  (:documentation "Return the average of DATA.")
  (:method ((numbers list))
    "Return the average of list of NUMBERS."
    (/ (reduce #'+ numbers) (length numbers)))
  (:method ((filename pathname))
    "Return the average of numbers from FILENAME."
    (average (data filename))))

(defgeneric expectancies (data)
  (:documentation "Return the expectancies of DATA.")
  (:method ((numbers list) &aux (average (average numbers)))
    "Return the list of expectancies for a LIST of numbers."
    (mapcar (lambda (value) (expectancy value average)) numbers))
  (:method ((filename pathname))
    "Return the expectancies of numbers from FILENAME."
    (expectancies (data filename))))

(defgeneric variance (data)
  (:documentation "Return the variance of DATA.")
  (:method ((numbers list))
    "Return the variance of list of NUMBERS."
    (average (expectancies numbers)))
  (:method ((filename pathname))
    "Return the variance of numbers from FILENAME."
    (expectancies (data filename))))

(defgeneric standard-deviation (data)
  (:documentation "Return the standard deviation of DATA.")
  (:method ((numbers list))
    "Return the standard deviation of list of NUMBERS."
    (sqrt (variance numbers)))
  (:method ((filename pathname))
    "Return the standard deviation of numbers from FILENAME."
    (standard-deviation (data filename))))
