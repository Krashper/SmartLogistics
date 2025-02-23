# **Проект: Система управления логистикой "SmartLogistics"**

**Описание проекта:**  
"SmartLogistics" — это проект базы данных для автоматизации процессов управления логистикой. В рамках проекта были разработаны концептуальная модель (с использованием **шаблона Чена**) и логическая модель базы данных. База данных приведена к **третьей нормальной форме (3NF)** для обеспечения целостности и оптимизации данных.

---

## **Структура проекта**

Проект включает три основных файла:

1. **Technical_Assignment.docx**  
   - Техническое задание (ТЗ) с описанием требований и функций базы данных.

2. **ER_model.vsdx**  
   - ER-модель (концептуальная модель) в формате **Visio** с использованием шаблона Чена.  

3. **db_creator.sql**  
   - SQL-код для создания базы данных в **PostgreSQL**.

4. **SmartLogistics.backup**
   - Backup-файл для точного воссоздания базы данных в **PostgreSQL**.

---

## **Реализованные модели**

1. **Концептуальная модель**  
   Разработана с использованием **ER-диаграммы Чена**, где сущности и их связи четко определены на верхнем уровне абстракции.

2. **Логическая модель**  
   Логическая структура таблиц и их связей. Логическая модель приведена к **третьей нормальной форме (3NF)** для устранения избыточности данных и обеспечения консистентности.

   👉 [[Ссылка на логическую модель](https://www.drawdb.app/editor?shareId=de6dd882a7bcf6a4f497ef16882ed85d)]()

3. **Физическая реализация**  
   SQL-код для создания базы данных с учетом требований проекта. Код включает:  
   - Создание таблиц.  
   - Определение первичных и внешних ключей.  
   - Установка ограничений для обеспечения целостности данных.  

---

## **Роли и права доступа**

Для базы данных **"SmartLogistics"** разработаны роли для разграничения доступа к данным и функциям системы. Ниже приведено описание каждой роли и её полномочий:

### **1. Администратор базы данных (`db_admin`)**  
**Описание:**  
Роль администратора базы данных предназначена для управления всей системой и её объектами.  

**Права:**  
- Создание, изменение и удаление таблиц, последовательностей и других объектов.
- Управление пользователями, их привилегиями и ролями.
- Выполнение любых операций в базе данных, включая изменения структуры таблиц, резервное копирование и восстановление данных.

---

### **2. Менеджер по работе с клиентами (`client_manager`)**  
**Описание:**  
Управляет информацией о клиентах, включая физические и юридические лица, а также их контактные данные.  

**Права:**  
- Просмотр, добавление, изменение и удаление записей о клиентах (таблицы клиентов, их контактов, юридических и физических лиц).
- Просмотр и обновление справочной информации о типах клиентов.  

---

### **3. Менеджер по работе с партнёрами (`partner_manager`)**  
**Описание:**  
Работает с данными о партнёрах и договорах с ними.  

**Права:**  
- Просмотр, добавление, изменение и удаление записей о партнёрах, их контактной информации и заключённых договорах.

---

### **4. Менеджер по заказам (`order_manager`)**  
**Описание:**  
Отвечает за управление заказами, маршрутами и статусами заказов.  

**Права:**  
- Полный доступ к информации о заказах, группах заказов, логах статусов и маршрутах.  
- Просмотр информации о клиентах, их типах, транспорте, складах и расписании обслуживания транспорта.  

---

### **5. Менеджер по транспорту (`transport_manager`)**  
**Описание:**  
Управляет транспортными средствами, их статусами и планами обслуживания.  

**Права:**  
- Просмотр, добавление, изменение и удаление данных о транспорте, их типах, статусах и расписаниях обслуживания.  
- Просмотр данных о маршрутах.  

---

### **6. Менеджер склада (`warehouse_manager`)**  
**Описание:**  
Обеспечивает управление складскими запасами и данными о грузах.  

**Права:**  
- Полный доступ к данным о складах и остатках на складах.  
- Просмотр информации о городах, грузах и их типах.  

---

### **7. Финансовый менеджер (`finance_manager`)**  
**Описание:**  
Контролирует финансовую сторону заказов и платежей.  

**Права:**  
- Управление данными о стоимости заказов.  
- Полный доступ к данным о платежных операциях (логи платежей).  
- Просмотр общей информации о заказах и клиентах.  

---

### **Общие меры безопасности:**  
- Роли имеют доступ только к данным и действиям, связанным с их функциональными обязанностями.  
- Администратор базы данных отвечает за назначение ролей и обеспечение безопасности.  
- Запрещено создание и удаление объектов (таблиц, схем) для ролей, кроме администратора базы данных.  

--- 



## **Технологический стек**

- **СУБД**: PostgreSQL  
- **ER-моделирование**: Microsoft Visio  
- **Язык запросов**: SQL  

---

## **Как использовать проект**

1. **Клонируйте репозиторий:**
   ```bash
   git clone https://github.com/Krashper/SmartLogistics.git
   cd SmartLogistics
   ```

2. **Установите PostgreSQL** и создайте базу данных:
   ```sql
   CREATE DATABASE smartlogistics;
   ```

3. **Запустите SQL-скрипт** для создания структуры БД:
   ```bash
   psql -U username -d smartlogistics -f db_creator.sql
   ```

4. **Проверьте созданные таблицы**:
   ```sql
   \dt
   ```

---

## **Лицензия**

Проект распространяется под лицензией **MIT**.

---

## **Контакты**

Если у вас есть вопросы или предложения по проекту, свяжитесь со мной:  
📧 **Email**: [ruslan251207@gmail.com](mailto:ruslan251207@gmail.com)  
