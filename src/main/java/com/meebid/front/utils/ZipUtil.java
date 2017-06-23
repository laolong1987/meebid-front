package com.meebid.front.utils;

/**
 * Created by gaoyang on 17/6/17.
 */
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public final class ZipUtil {

    private ZipUtil() {
        // empty
    }

    /**
     * 压缩文件
     *
     * @param filePath
     *            待压缩的文件路径
     * @return 压缩后的文件
     */
    public static File zip(String filePath) {
        File target = null;
        File source = new File(filePath);
        if (source.exists()) {
            // 压缩文件名=源文件名.zip
            String zipName = source.getName() + ".zip";
            target = new File(source.getParent(), zipName);
            if (target.exists()) {
                target.delete(); // 删除旧的文件
            }
            FileOutputStream fos = null;
            ZipOutputStream zos = null;
            try {
                fos = new FileOutputStream(target);
                zos = new ZipOutputStream(new BufferedOutputStream(fos));
                // 添加对应的文件Entry
                addEntry("/", source, zos);
            } catch (IOException e) {
                throw new RuntimeException(e);
            } finally {
                IOUtil.closeQuietly(zos, fos);
            }
        }
        return target;
    }

    /**
     * 扫描添加文件Entry
     *
     * @param base
     *            基路径
     *
     * @param source
     *            源文件
     * @param zos
     *            Zip文件输出流
     * @throws IOException
     */
    private static void addEntry(String base, File source, ZipOutputStream zos)
            throws IOException {
        // 按目录分级，形如：/aaa/bbb.txt
        String entry = base + source.getName();
        if (source.isDirectory()) {
            for (File file : source.listFiles()) {
                // 递归列出目录下的所有文件，添加文件Entry
                addEntry(entry + "/", file, zos);
            }
        } else {
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                byte[] buffer = new byte[1024 * 10];
                fis = new FileInputStream(source);
                bis = new BufferedInputStream(fis, buffer.length);
                int read = 0;
                zos.putNextEntry(new ZipEntry(entry));
                while ((read = bis.read(buffer, 0, buffer.length)) != -1) {
                    zos.write(buffer, 0, read);
                }
                zos.closeEntry();
            } finally {
                IOUtil.closeQuietly(bis, fis);
            }
        }
    }

    /**
     * 解压文件
     *
     * @param filePath
     *            压缩文件路径
     */
    public static void unzip(String filePath) {
        File source = new File(filePath);
        if (source.exists()) {
            ZipInputStream zis = null;
            BufferedOutputStream bos = null;
            try {
                zis = new ZipInputStream(new FileInputStream(source));
                ZipEntry entry = null;
                while ((entry = zis.getNextEntry()) != null
                        && !entry.isDirectory()) {
//                    if ("__MACOSX/".equals(entry.getName())){
//                        continue;
//                    }
                    File target = new File(source.getParent(), entry.getName());
                    if (!target.getParentFile().exists()) {
                        // 创建文件父目录
                        target.getParentFile().mkdirs();
                    }
                    // 写入文件
                    bos = new BufferedOutputStream(new FileOutputStream(target));
                    int read = 0;
                    byte[] buffer = new byte[1024 * 10];
                    while ((read = zis.read(buffer, 0, buffer.length)) != -1) {
                        bos.write(buffer, 0, read);
                    }
                    bos.flush();
                }
                zis.closeEntry();
            } catch (IOException e) {
                throw new RuntimeException(e);
            } finally {
                IOUtil.closeQuietly(zis, bos);
            }
        }
    }


    /**
     * 解压zip
     */
    public static void unzipMAC(String zipPath) {
        File source = new File(zipPath);
        FileOutputStream fos= null;
        BufferedOutputStream bos=null;
        try {
        ZipFile zipFile = new ZipFile(zipPath);
        Enumeration emu = zipFile.entries();
        int i = 0;
        while (emu.hasMoreElements()) {
            ZipEntry entry = (ZipEntry) emu.nextElement();
            String fileName=entry.getName().toLowerCase();
            if(!fileName.startsWith("__macosx/"))
            {
                //如果文件名没有以__macosx/开头，且以psd结尾，就是psd文件，解压,在mac下压缩的文件，会自动加上__macosx目录，但其实是没用的
                BufferedInputStream bis = new BufferedInputStream(
                        zipFile.getInputStream(entry));
                File file =  new File(source.getParent(), entry.getName());
                //一次读40K
                int BUFFER=40960;
                 fos = new FileOutputStream(file);
                 bos = new BufferedOutputStream(fos, BUFFER);

                int count;
                byte data[] = new byte[BUFFER];
                while ((count = bis.read(data, 0, BUFFER)) != -1) {
                    bos.write(data, 0, count);
                }
                bos.flush();
                bos.close();
                bis.close();
            }
        }
        zipFile.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            IOUtil.closeQuietly(fos, bos);
        }
    }

    public static void print(File f,List<File> fileList){
        List<File> filelist=new ArrayList<>();
        if(f!=null){
            if(f.isDirectory()){
                File[] fileArray=f.listFiles();
                if(fileArray!=null){
                    for (int i = 0; i < fileArray.length; i++) {
                        //递归调用
                        print(fileArray[i],fileList);
                    }
                }
            }
            else{
                System.out.println(f);
                filelist.add(f);
            }
        }
//        return filelist;
    }

    public static String [] getFileName(String path)
    {
        File file = new File(path);
        String [] fileName = file.list();
        return fileName;
    }
    public static void getAllFileName(String path,ArrayList<String> fileName)
    {
        File file = new File(path);
        File [] files = file.listFiles();
        String [] names = file.list();
        if(names != null)
            fileName.addAll(Arrays.asList(names));
        for(File a:files)
        {
            if(a.isDirectory())
            {
                getAllFileName(a.getAbsolutePath(),fileName);
            }
        }
    }

    public static void main(String[] args) {
        String targetPath = "/Users/gaoyang/Documents/workspace/meebid-front/out/artifacts/app/file/c0a80068-5c97-1892-815c-974492570002/13bb854a-75ba-414b-90d4-dd14c0a654ff归档.zip";
        String targetPath2 = "/Users/gaoyang/Documents/workspace/meebid-front/out/artifacts/app/file/c0a80068-5c97-1892-815c-974492570002";
        try {
            ZipUtil.unzipMAC(targetPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}