# flutter_ui_kit
flutter_ui_kit


# 패키지 생성 

- packages/flutter_ui_kit_{패키지명} 폴더를 만들고 그 폴더 아래에서 명령어 실행

```
flutter create --template=package .
```

# 패키지 업로드 방법

- bootstrap

```shell
melos bootstrap
```

- 버전 업데이트 할떄
> 커밋을 해야 버전을 업데이트 인식한다

```shell
melos version --all
```


- 패키지 리스트

```shell
melos list
```


```yaml
dependencies:
  flutter_ui_kit_google_mobile_ads:
    git:
      url: https://github.com/jun-young1993/flutter_ui_kit.git
      # ref를 생략하거나 main으로 두면 최신 코드를 가져오고,
      # 특정 버전을 고정하려면 Melos가 생성한 태그명을 적습니다.
      ref: flutter_ui_kit_google_mobile_ads-v0.0.1 
      path: packages/flutter_ui_kit_google_mobile_ads
```


```shell
flutter pub upgrade flutter_ui_kit_google_mobile_ads
```

```shell
flutter pub upgrade flutter_ui_kit_theme
```



# Melos 명령어들

melos bootstrap

> 그러면 melos가 모든 로컬 패키지를 연결하고 종속성을 자동으로 업데이트 합니다. 터미널에서 다음과 같이 출력이 됩니다.


```shell
melos publish --no-dry-run --git-tag-version --yes
```