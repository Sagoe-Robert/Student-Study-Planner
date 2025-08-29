SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `index_number` varchar(20) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `student` (`id`, `name`, `index_number`, `gender`, `password`, `email`, `phone`, `created_at`) VALUES
(1, 'Demo Student', 'DEMO001', 'Other', 'demo123', 'demo@example.com', NULL, '2025-08-28 16:57:46');

CREATE TABLE `study_goals` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL DEFAULT 1,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `status` enum('Active','Completed','Abandoned') DEFAULT 'Active',
  `priority` enum('Low','Medium','High') DEFAULT 'Medium',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `study_goals` (`id`, `student_id`, `title`, `description`, `target_date`, `status`, `priority`, `created_at`, `completed_at`) VALUES
(1, 1, 'English', 'learn', '2025-08-29', 'Active', 'Medium', '2025-08-28 17:00:39', NULL),
(2, 1, 'Social Studies', 'Tutor Akwasi', '2025-08-30', 'Active', 'Medium', '2025-08-28 17:04:53', NULL);

ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_number` (`index_number`);

ALTER TABLE `study_goals`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `study_goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;
