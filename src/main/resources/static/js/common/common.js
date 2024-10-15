
// 날짜 형식 맞추기 (yyyy-mm-dd)
const formatDate = (date) => {
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2);
    const day = ('0' + date.getDate()).slice(-2);
    return `${year}-${month}-${day}`;
};

//ckEditor 이미지 업로드 utils
const uploadAdapter = (loader) => {
   return {
     upload: () => {
       return new Promise((resolve, reject) => {
         loader.file.then((file) => {
           // 만약 서버에 이미지 올리고 받는 등 추가 작업 있을 시 추가해서 이미지 주소를 가져온다.
           resolve({
             default: '여기에 이미지 주소 넣으면 됩니다.',
           });
         });
       });
     },
   };
 };
 
/*const uploadPlugin = (editor) => {
  editor.plugins.get('FileRepository').createUploadAdapter = (
    loader: any
  ) => {
    return uploadAdapter(loader);
  };
};*/