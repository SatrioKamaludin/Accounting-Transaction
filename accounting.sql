CREATE TABLE IF NOT EXISTS `accounting_transaction` (
  `transaction_id` varchar(10) NOT NULL,
  `transaction_date` date NOT NULL,
  `entry_date` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `transaction_type_id` varchar(10) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `transaction_type_id` (`transaction_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounting_transaction`
--

INSERT INTO `accounting_transaction` (`transaction_id`, `transaction_date`, `entry_date`, `description`, `transaction_type_id`) VALUES
('T1', '2014-09-03', '2014-09-08', 'investment', '1');

-- --------------------------------------------------------

--
-- Table structure for table `accounting_transaction_type`
--

CREATE TABLE IF NOT EXISTS `accounting_transaction_type` (
  `transaction_type_id` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`transaction_type_id`),
  KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounting_transaction_type`
--

INSERT INTO `accounting_transaction_type` (`transaction_type_id`, `description`) VALUES
('1', 'Asset'),
('2', 'Liability'),
('3', 'Owner''s Equity');

-- --------------------------------------------------------

--
-- Table structure for table `general_ledger_account`
--

CREATE TABLE IF NOT EXISTS `general_ledger_account` (
  `gl_account_id` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`gl_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_ledger_account`
--

INSERT INTO `general_ledger_account` (`gl_account_id`, `description`) VALUES
('1001', 'Cash'),
('1004', 'Supply'),
('3001', 'Modal');

-- --------------------------------------------------------

--
-- Table structure for table `organization_gl_account_balance`
--

CREATE TABLE IF NOT EXISTS `organization_gl_account_balance` (
  `org_gl_id` varchar(10) NOT NULL,
  `amount` int(100) NOT NULL,
  `gl_account_id` varchar(10) NOT NULL,
  PRIMARY KEY (`org_gl_id`),
  KEY `gl_account_id` (`gl_account_id`),
  KEY `gl_account_id_2` (`gl_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_gl_account_balance`
--

INSERT INTO `organization_gl_account_balance` (`org_gl_id`, `amount`, `gl_account_id`) VALUES
('OJA1', 10000, '1001'),
('OJA2', 10000, '3001');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE IF NOT EXISTS `transaction_detail` (
  `transaction_detail_seq_id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` int(100) NOT NULL,
  `debit_credit_flag` char(1) NOT NULL,
  `transaction_id` varchar(10) NOT NULL,
  `org_gl_id` varchar(10) NOT NULL,
  PRIMARY KEY (`transaction_detail_seq_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `transaction_id_2` (`transaction_id`),
  KEY `transaction_id_3` (`transaction_id`),
  KEY `ogr_gl_id` (`org_gl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`transaction_detail_seq_id`, `amount`, `debit_credit_flag`, `transaction_id`, `org_gl_id`) VALUES
(1, 10000, 'D', 'T1', 'OJA1'),
(2, 10000, 'C', 'T1', 'OJA2');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounting_transaction`
--
ALTER TABLE `accounting_transaction`
  ADD CONSTRAINT `fk_trans_transtype` FOREIGN KEY (`transaction_type_id`) REFERENCES `accounting_transaction_type` (`transaction_type_id`);

--
-- Constraints for table `organization_gl_account_balance`
--
ALTER TABLE `organization_gl_account_balance`
  ADD CONSTRAINT `fk_orgGL_generalLedger` FOREIGN KEY (`gl_account_id`) REFERENCES `general_ledger_account` (`gl_account_id`);

--
-- Constraints for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `fk_trans_detail_orgGL` FOREIGN KEY (`org_gl_id`) REFERENCES `organization_gl_account_balance` (`org_gl_id`),
  ADD CONSTRAINT `fk_trans_transdetail` FOREIGN KEY (`transaction_id`) REFERENCES `accounting_transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
