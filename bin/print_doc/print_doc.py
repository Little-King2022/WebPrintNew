import win32com.client
import sys
import datetime



def print_document(file_path, copies):
    try:
        # 启动 Word 应用
        word = win32com.client.Dispatch("Word.Application")
        word.Visible = False  # 设置为 False 使 Word 在后台运行

        # 打开文档
        doc = word.Documents.Open(file_path)

        # 执行打印
        doc.PrintOut(Copies=copies)

        # 关闭文档
        doc.Close()

        # 退出 Word 应用
        word.Quit()

        print(f"打印 {copies} 份文档完成：{file_path}")
    except Exception as e:
        print(f"打印失败: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("用法: python print_doc.py <文件路径> <打印份数>")
        sys.exit(1)

    file_path = sys.argv[1]  # 第一个命令行参数是文件路径
    try:
        copies = int(sys.argv[2])  # 第二个命令行参数是打印份数
    except ValueError:
        print("打印份数必须是一个整数")
        sys.exit(1)

    print_document(file_path, copies)
