# flutter_ui_kit
flutter_ui_kit


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