import {
	ClassicEditor,
	AccessibilityHelp,
	Alignment,
	AutoImage,
	AutoLink,
	Autosave,
	Bold,
	CloudServices,
	Essentials,
	FontBackgroundColor,
	FontColor,
	FontFamily,
	FontSize,
	Highlight,
	ImageBlock,
	ImageCaption,
	ImageInline,
	ImageInsert,
	ImageInsertViaUrl,
	ImageResize,
	ImageStyle,
	ImageTextAlternative,
	ImageToolbar,
	ImageUpload,
	Italic,
	Link,
	LinkImage,
	Paragraph,
	SelectAll,
	SimpleUploadAdapter,
	SpecialCharacters,
	SpecialCharactersArrows,
	SpecialCharactersCurrency,
	SpecialCharactersEssentials,
	SpecialCharactersLatin,
	SpecialCharactersMathematical,
	SpecialCharactersText,
	Strikethrough,
	Table,
	TableCaption,
	TableCellProperties,
	TableColumnResize,
	TableProperties,
	TableToolbar,
	Underline,
	Undo
} from '/ckeditor5/ckeditor5.js';

import translations from '/ckeditor5/translations/ko.js';

class MyUploadAdapter {
    constructor(loader) {
        this.loader = loader;
        this.url = '/comm/uploadFile'; // 서버 업로드 엔드포인트
    }

    upload() {
        return this.loader.file
            .then((file) => new Promise((resolve, reject) => {
                const formData = new FormData();
                formData.append('file', file);

                $.ajax({
                    url: this.url,
                    type: 'POST',
                    data: formData,
                    processData: false, // 파일 데이터를 쿼리 문자열로 변환하지 않음
                    contentType: false, // Content-Type을 자동으로 설정
                    success: (response) => {
                        if (response.uploaded) {
                            resolve({
                                default: response.url, // 서버에서 반환된 이미지 URL
                            });
                            
                            if(boardId == 'GALLERY'){
								addThumbnailCandidate(response.url); // 썸네일 후보 추가
							}
                        } else {
                            reject(response.error || '업로드 실패');
                        }
                    },
                    error: (xhr, status, error) => {
                        console.error('AJAX 요청 중 오류 발생:', error);
                        reject('업로드 실패');
                    },
                });
            }));
    }

    abort() {
        console.warn('업로드가 중단되었습니다.');
    }
}

// 썸네일 후보를 추가하는 함수
function addThumbnailCandidate(imageUrl) {
    const thumbnailCandidatesDiv = document.getElementById('thumbnailCandidates');

    // 썸네일 이미지 추가
    const thumbnail = document.createElement('div');
    thumbnail.classList.add('thumbnail-item');
    thumbnail.innerHTML = `<img src="${imageUrl}" alt="Thumbnail" />`;
    thumbnail.addEventListener('click', () => {
        // 선택 상태 초기화
        const allThumbnails = document.querySelectorAll('.thumbnail-item');
        allThumbnails.forEach((thumb) => thumb.classList.remove('selected-thumbnail'));

        // 현재 선택된 썸네일 강조
        thumbnail.classList.add('selected-thumbnail');
    });

    thumbnailCandidatesDiv.appendChild(thumbnail);
}

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new MyUploadAdapter(loader);
    };
}


const editorConfig = {
	toolbar: {
		items: [
			'undo',
			'redo',
			'|',
			'fontSize',
			'fontFamily',
			'fontColor',
			'fontBackgroundColor',
			'|',
			'bold',
			'italic',
			'underline',
			'strikethrough',
			'|',
			'specialCharacters',
			'link',
			'insertImage',
			'insertTable',
			'highlight',
			'|',
			'alignment'
		],
		shouldNotGroupWhenFull: false
	},
	plugins: [
		AccessibilityHelp,
		Alignment,
		AutoImage,
		AutoLink,
		Autosave,
		Bold,
		CloudServices,
		Essentials,
		FontBackgroundColor,
		FontColor,
		FontFamily,
		FontSize,
		Highlight,
		ImageBlock,
		ImageCaption,
		ImageInline,
		ImageInsert,
		ImageInsertViaUrl,
		ImageResize,
		ImageStyle,
		ImageTextAlternative,
		ImageToolbar,
		ImageUpload,
		Italic,
		Link,
		LinkImage,
		Paragraph,
		SelectAll,
		SimpleUploadAdapter,
		SpecialCharacters,
		SpecialCharactersArrows,
		SpecialCharactersCurrency,
		SpecialCharactersEssentials,
		SpecialCharactersLatin,
		SpecialCharactersMathematical,
		SpecialCharactersText,
		Strikethrough,
		Table,
		TableCaption,
		TableCellProperties,
		TableColumnResize,
		TableProperties,
		TableToolbar,
		Underline,
		Undo
	],
	fontFamily: {
		supportAllValues: true
	},
	fontSize: {
		options: [10, 12, 14, 'default', 18, 20, 22],
		supportAllValues: true
	},
	image: {
		toolbar: ['imageTextAlternative']
	},
	language: 'ko',
	link: {
		addTargetToExternalLinks: true,
		defaultProtocol: 'https://',
		decorators: {
			toggleDownloadable: {
				mode: 'manual',
				label: 'Downloadable',
				attributes: {
					download: 'file'
				}
			}
		}
	},
	extraPlugins: [MyCustomUploadAdapterPlugin], // 커스텀 업로드 어댑터 추가
	placeholder: 'Type or paste your content here!',
	table: {
		contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells', 'tableProperties', 'tableCellProperties']
	},
	translations: [translations]
};

ClassicEditor.create(document.querySelector('#classic'), editorConfig)
.then( editor => {
    console.log( 'ckEditor이 초기화되었습니다.', editor );
    myEditor = editor;
    
  	//수정일 경우
	if(boardId != '' && seq != ''){
        getData().then(() => {
            // 에디터 데이터 로드 후 이미지 처리
            const editorContent = myEditor.getData();
            const tempDiv = document.createElement('div');
            tempDiv.innerHTML = editorContent;

            // 에디터 내 이미지 태그 추출
            const images = tempDiv.querySelectorAll('img');
            images.forEach(img => {
                const imageUrl = img.src; // 이미지 URL 가져오기
                addThumbnailCandidate(imageUrl); // 썸네일 후보 추가
            });
        });
	}
} );

